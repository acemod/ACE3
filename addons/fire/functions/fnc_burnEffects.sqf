#include "..\script_component.hpp"
/*
 * Author: tcvm, johnb43
 * Spawns particle effects for a burning unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_fire_fnc_burnEffects
 *
 * Public: No
 */

params ["_unit"];

// Spawn particles
private _unitPos = getPos _unit;
private _fireParticle = objNull;
private _smokeParticle = objNull;
private _fireLight = objNull;
private _lightFlare = objNull;

if (hasInterface) then {
    _fireParticle = createVehicleLocal ["#particlesource", _unitPos, [], 0, "CAN_COLLIDE"];
    _fireParticle attachTo [_unit];
    _fireParticle setDropInterval 0.03;

    _smokeParticle = createVehicleLocal ["#particlesource", _unitPos, [], 0, "CAN_COLLIDE"];

    _fireLight = createVehicleLocal ["#lightpoint", _unitPos, [], 0, "CAN_COLLIDE"];
    _fireLight setLightIntensity 0;
    _fireLight setLightAmbient [0.8, 0.6, 0.2];
    _fireLight setLightColor [1, 0.5, 0.4];
    _fireLight attachTo [_unit];
    _fireLight setLightDayLight false;

    _lightFlare = createVehicleLocal ["#lightpoint", _unitPos, [], 0, "CAN_COLLIDE"];
    _lightFlare setLightIntensity 0;
    _lightFlare setLightColor [1, 0.8, 0.8];
    _lightFlare setLightUseFlare true;
    _lightFlare setLightFlareMaxDistance 100;
    _lightFlare setLightFlareSize 0;

    if (_unit != ACE_player) then {
        private _relativeAttachPoint = vectorNormalized (_unit worldToModelVisual (getPos ACE_player));
        _relativeAttachPoint set [2, 0.5];
        _lightFlare attachTo [_unit, _relativeAttachPoint];
    } else {
        _lightFlare attachTo [_unit, [0, 0, 0.3]];
    };
};

private _fireSound = objNull;

if (isServer) then {
    _fireSound = createSoundSource ["Sound_Fire", _unitPos, [], 0];
    _fireSound attachTo [_unit, [0, 0, 0], "Head"];
};

[{
    params ["_args", "_pfhID"];
    _args params ["_unit", "_fireParticle", "_smokeParticle", "_fireLight", "_lightFlare", "_fireSound"];

    if (isNull _unit || {!(_unit call FUNC(isBurning))}) exitWith {
        _pfhID call CBA_fnc_removePerFrameHandler;

        deleteVehicle _fireParticle;
        deleteVehicle _smokeParticle;
        deleteVehicle _fireLight;
        deleteVehicle _lightFlare;
        deleteVehicle _fireSound;
    };

    // Display burn indicators
    if (_unit == ACE_player && {alive _unit} && {isNil {_unit getVariable QGVAR(burnUIPFH)}}) then { // This accounts for player remote controlled a new unit
        private _burnIndicatorPFH = [LINKFUNC(burnIndicator), 1, _unit] call CBA_fnc_addPerFrameHandler;
        _unit setVariable [QGVAR(burnUIPFH), _burnIndicatorPFH];
    };

    if (!hasInterface) exitWith {};

    private _intensity = _unit getVariable [QGVAR(intensity), 0];

    _fireParticle setDropInterval (0.01 max linearConversion [BURN_MAX_INTENSITY, BURN_MIN_INTENSITY, _intensity, 0.03, 0.1, false]);
    _fireParticle setParticleParams [
        ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 10, 32], // sprite sheet values
        "", // animation name
        "Billboard", // particle type
        1, // timer period
        0.7, // lifetime
        "destructionEffect2", // position
        [0, 0, 1], // move velocity
        0, // rotation velocity
        10, // weight
        7.9, // volume
        1, // rubbing
        [0.3, 0.3], // size
        [
            [1, 1, 1, -0],
            [1, 1, 1, -1],
            [1, 1, 1, -1],
            [1, 1, 1, -1],
            [1, 1, 1, -0]
        ], // colour
        [0.5, 1], // animation speed
        1, // random dir period
        0, // random dir intensity
        "", // on timer script
        "", // before destroy script
        _unit, // particle source
        0,
        false,
        0,
        [[0.8, 0.6, 0.2, 1]] // emissive color
    ];
    _fireParticle setParticleRandom [
        0.04 * _intensity, // life time
        [0.05, 0.05, 2], // position
        [0.05, 0.05, 0.05] vectorMultiply _intensity, // move velocity
        0, // rotation velocity
        0.06 * _intensity, // size
        [0, 0, 0, 0], // color
        0, // random direction period
        0 // random direction intensity
    ];

    _smokeParticle setDropInterval 0.15;
    _smokeParticle setParticleCircle [0, [0, 0, 0]];
    _smokeParticle setParticleParams [
        ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 48], // sprite sheet values
        "", // animation name
        "Billboard", // particle type
        1, // timer period
        8, // lifetime
        [0, 0, 1.1], // position
        [0, 0, 1], // move velocity
        0, // rotation velocity
        10, // weight
        7.9, // volume
        0.066, // rubbing
        [1, 3, 6], // size
        [
            [0.5, 0.5, 0.5, 0.15],
            [0.75, 0.75, 0.75, 0.075],
            [1, 1, 1, 0]
        ], // colour
        [0.125], // animation speed
        1, // random dir period
        0, // random dir intensity
        "", // on timer script
        "", // before destroy script
        _unit // particle source
    ];
    _smokeParticle setParticleRandom [
        0, // life time
        [0.25, 0.25, 0], // position
        [0.2, 0.2, 0], // move velocity
        0, // rotation velocity
        0.25, // size
        [0, 0, 0, 0.1], // color
        0, // random direction period
        0 // random direction intensity
    ];

    _fireLight setLightBrightness ((_intensity * 3) / 10);
    _fireLight setLightAttenuation [1, 10 max (5 min (10 - _intensity)), 0, 15];

    _lightFlare setLightBrightness (_intensity / 30);
    _lightFlare setLightFlareSize (_intensity * (3 / 4)) * FLARE_SIZE_MODIFIER;

    if (!GVAR(enableFlare)) then {
        _lightFlare setLightFlareSize 0;
    };

    // Always keep flare visible to perceiving unit as long as it isn't the player
    if (_unit != ACE_player) then {
        private _distanceToUnit = _unit distance ACE_player;
        private _relativeAttachPoint = [0, 0, 0.3];

        if (_distanceToUnit > 1.5) then {
            _relativeAttachPoint = (vectorNormalized (_unit worldToModelVisual (getPos ACE_player))) vectorMultiply linearConversion [5, 30, _distanceToUnit, 0.5, 1.5];
            _relativeAttachPoint set [2, 0.3 + ((_unit selectionPosition "pelvis") select 2)];
        };

        _lightFlare attachTo [_unit, _relativeAttachPoint];
    };
}, 0, [_unit, _fireParticle, _smokeParticle, _fireLight, _lightFlare, _fireSound]] call CBA_fnc_addPerFrameHandler;
