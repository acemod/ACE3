/*
 * Author: KoffeinFlummi, commy2
 * Start fire in engine block of a car.
 *
 * Arguments:
 * 0: Vehicle <Object>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 4] call ace_cookoff_fnc_burn
 *
 * Public: No
 */
#include "script_component.hpp"

//#define ENABLE_PP_EFFECT

params [["_unit", objNull, [objNull]], ["_intensity", 0, [0]]];

if (_unit getVariable [QGVAR(isBurning), false]) exitWith {};
_unit setVariable [QGVAR(isBurning), true];

[QGVAR(burn), [_unit, _intensity]] call CBA_fnc_remoteEvent;

[{
    // ----- function
    (_this getVariable "params") params ["_unit"];
    _effects params ["_fire", "_smoke", "_light"];

    // recieve latest synched value
    _intensity = _unit getVariable [QGVAR(value), _intensity];

    // update effects
    _fire setParticleParams [
        ["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32],
        "",
        "Billboard",
        1,
        0.3 * _intensity,
        "destructionEffect2",
        [0, 0, 0.17 * _intensity],
        0,
        10,
        7.9,
        1,
        [0.3 * _intensity, 0.05 * _intensity],
        [
            [1,1,1,-0],
            [1,1,1,-1],
            [1,1,1,-1],
            [1,1,1,-1],
            [1,1,1,-1],
            [1,1,1,0]
        ],
        [0.5,1],
        1,
        0,
        "",
        "",
        _unit
    ];

    _fire setParticleRandom [
        0.04 * _intensity,
        ([0.1,0.1,0.1] vectorMultiply _intensity),
        ([0.05,0.05,0.05] vectorMultiply _intensity),
        0,
        0.06 * _intensity,
        [0,0,0,0],
        0,
        0
    ];

    private _color = 0.8 / _intensity;

    _smoke setDropInterval (0.01 + 0.02 * _intensity);
    _smoke setParticleParams [
        ["\A3\data_f\ParticleEffects\Universal\Universal",16,7,48],
        "",
        "Billboard",
        1,
        3 * _intensity,
        "destructionEffect1",
        [0, 0, 0.5 * _intensity],
        0,
        0.05,
        0.04,
        0.05,
        [0.5 * _intensity, 3 * _intensity],
        [
            [_color, _color, _color, 0.2],
            [_color, _color, _color, 1],
            [_color, _color, _color, 1],
            [0.05 + _color, 0.05 + _color, 0.05 + _color, 0.9],
            [0.1 + _color, 0.1 + _color, 0.1 + _color, 0.6],
            [0.2 + _color, 0.2 + _color, 0.2 + _color, 0.3],
            [1,1,1,0]
        ],
        [0.8,0.3,0.25],
        1,
        0,
        "",
        "",
        _unit
    ];

    _smoke setParticleRandom [
        0.7 * _intensity,
        [1 - _intensity / 10, 1 - _intensity / 10, 1 - _intensity / 10],
        [0.2 * _intensity, 0.2 * _intensity, 0.05 * _intensity],
        0,
        0.3,
        [0.05,0.05,0.05,0],
        0,
        0
    ];

    _light setLightBrightness (_intensity / 30);

    // pp effect
    #ifdef ENABLE_PP_EFFECT
    private _fnc_FlameEffect = {
        params ["_unit", "_fnc_FlameEffect", "_counter"];

        if (_unit == ACE_player) then {
            [] call BIS_fnc_flamesEffect;
        };

        DEC(_counter);

        if (_counter > 0) then {
            [_fnc_FlameEffect, [_unit, _fnc_FlameEffect, _counter], 0.4] call CBA_fnc_waitAndExecute
        };
    };

    [_unit, _fnc_FlameEffect, 3] call _fnc_FlameEffect; // recursive function
    #endif

    // update for next cycle, only on local machine
    if (local _unit) then {
        // timer
        _intensity = _intensity - (0.02 + rain / 10) * (CBA_missionTime - _time);

        // player is trying to put out fire by rolling on the ground
        if (animationState _unit in PRONE_ROLLING_ANIMS) then {
            _intensity = _intensity - 0.2;
        };

        // stop burning in water
        private _positionASLW = getPosASLW _unit;

        if (surfaceIsWater _positionASLW && {_positionASLW select 2 < 0}) then {
            _intensity = 0;
        };

        // synch "value"
        _unit setVariable [QGVAR(value), _intensity, true];
    };

    _time = CBA_missionTime;
}, 1, [_unit, _intensity], {
    // ----- start
    (_this getVariable "params") params ["_unit", "_intensity"];

    if (local _unit) then {
        _unit setVariable [QGVAR(value), _intensity, true];
    };

    _time = CBA_missionTime;

    // init effects
    private _position = position _unit;

    private _fire = "#particlesource" createVehicleLocal _position;
    _fire attachTo [_unit, [0,0,0], "destructionEffect2"];
    _fire setDropInterval 0.02;

    private _smoke = "#particlesource" createVehicleLocal _position;
    _smoke attachTo [_unit, [0,0,0], "destructionEffect1"];

    private _light = "#lightpoint" createVehicleLocal _position;
    _light setLightBrightness 0;
    _light setLightAmbient [0.8,0.6,0.2];
    _light setLightColor [1,0.5,0.4];
    _light lightAttachObject [_unit, [0,0,0]];

    _effects = [_fire, _smoke, _light];

    if (isServer) then {
        private _sound = createSoundSource ["Sound_Fire", _position, [], 0];
        _sound attachTo [_unit, [0,0,0], "destructionEffect1"];

        _effects pushBack _sound;
    };
}, {
    // ----- end
    (_this getVariable "params") params ["_unit"];

    {deleteVehicle _x} forEach _effects;
    _unit setVariable [QGVAR(isBurning), false];
}, {
    // ----- run condition
    true
}, {
    (_this getVariable "params") params ["_unit"];

    // ----- exit condition
    isNull _unit || {_intensity < 1}
}, ["_intensity", "_effects", "_time"]] call CBA_fnc_createPerFrameHandlerLogic;
