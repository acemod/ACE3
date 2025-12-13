#include "..\script_component.hpp"
/*
 * Author: tcvm, johnb43
 * Spawn cook-off fire effects.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Spawn fire jet <BOOL>
 * 2: Spawn fire ring <BOOL>
 * 3: What selection fire will originate from <STRING or ARRAY>
 * 4: Cookoff intensity value <NUMBER>
 * 5: Start time <NUMBER>
 * 6: Duration of effect (max 20 seconds) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, true, false, "commander_turret", 6, CBA_missionTime, 15] call ace_cookoff_fnc_cookOffLocal
 *
 * Public: No
 */

#define FLAME_SIZE 1.5
#define FIRE_INTENSITY 20

params ["_vehicle", "_jet", "_ring", "_fireSelection", "_intensity", "_startTime", "_duration"];

// Check if still valid for JIP players
if (isNull _vehicle || {CBA_missionTime - _startTime >= _duration}) exitWith {};

// Spawn light
private _light = objNull;

if (hasInterface) then {
    _light = "#lightpoint" createVehicleLocal [0, 0, 0];
    _light setLightBrightness 5;
    _light setLightAmbient [0.8, 0.6, 0.2];
    _light setLightColor [1, 0.5, 0.2];
    _light lightAttachObject [_vehicle, [0, 0, 0]];
};

_duration = 0 max _duration min 20;

private _sound = objNull;
private _fireKey = "";

if (isServer) then {
    // Spawn sound effect
    if (_jet || _ring) then {
        private _soundName = selectRandomWeighted [QGVAR(Sound_low), 0.1, QGVAR(Sound_mid), 0.25, QGVAR(Sound_high), 0.65];
        _sound = createSoundSource [_soundName, ASLToAGL getPosASL _vehicle, [], 0];
        _sound attachTo [_vehicle];
    };

    // Make the ring a source of fire
    if (_ring && {["ace_fire"] call EFUNC(common,isModLoaded)}) then {
        _fireKey = format [QGVAR(cookoffFire_%1), hashValue _vehicle];

        [QEGVAR(fire,addFireSource), [_vehicle, FLAME_SIZE * ((boundingBoxReal _vehicle) select 2), FIRE_INTENSITY, _fireKey]] call CBA_fnc_localEvent;
    };
};

[{
    (_this select 0) params ["_vehicle", "_jet", "_ring", "_startTime", "_duration", "_light", "_fireSelection", "_sound", "_intensity", "_fireKey"];

    private _elapsedTime = CBA_missionTime - _startTime;

    // Clean up effects once effects have finished or vehicle has been deleted
    if (isNull _vehicle || {_elapsedTime >= _duration}) exitWith {
        (_this select 1) call CBA_fnc_removePerFrameHandler;

        deleteVehicle _light;

        if (isServer) then {
            deleteVehicle _sound;

            if (["ace_fire"] call EFUNC(common,isModLoaded)) then {
                [QEGVAR(fire,removeFireSource), _fireKey] call CBA_fnc_localEvent;
            };
        };
    };

    private _factor = 1 + (_elapsedTime / 2) min 2;

    if (_elapsedTime > _duration * 3 / 4) then {
        _factor = _factor * linearConversion [_duration * 3 / 4, _duration, _elapsedTime, 1, 0.5];
    };

    // Make flame push object into ground to make effect seem more "alive"
    if (_jet && !isGamePaused && {local _vehicle} && {_vehicle getVariable [QGVAR(nextForceTime), 0] <= CBA_missionTime}) then {
        private _force = [0, 0, _factor * -(0.5 min random 1.5) * (0.3 min random 1)] vectorMultiply getMass _vehicle;
        _vehicle addForce [_force, vectorUpVisual _vehicle];
        _vehicle setVariable [QGVAR(nextForceTime), CBA_missionTime + 0.01]; // This prevents bad behaviour when setAccTime is small
    };

    // Don't spawn visual effects on machines without interfaces
    if (!hasInterface) exitWith {};

    _light setLightBrightness _factor;

    if (_jet) then {
        private _particlePosition = (_vehicle selectionPosition _fireSelection) vectorAdd [-0.1 + random 0.2, -0.1 + random 0.2, 0];

        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "",
            "Billboard",
            1,
            (0.1 + random 0.2) * _factor,
            _particlePosition,
            [0, 0, 15 * (_factor / 2)],
            0,
            10,
            7.9,
            0.075,
            [1.25 * _factor, 2.5 * _factor],
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]],
            [2 + random 1],
            1,
            0,
            "",
            "",
            _vehicle
        ];
    };

    if (_ring) then {
        private _ringOrigin = (_vehicle selectionPosition _fireSelection) vectorAdd [-0.1 + random 0.2, -0.1 + random 0.2, -1];
        private _dir = 20 * (_factor / 2);

        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + random 0.2) * _factor,
            _ringOrigin,
            [0, _dir, 0],
            0, 10, 7.9, 0.075,
            [1.25 * _factor, FLAME_SIZE * _factor],
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]],
            [2 + random 1], 1, 0, "", "", _vehicle
        ];
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + random 0.2) * _factor,
            _ringOrigin,
            [0, -_dir, 0],
            0, 10, 7.9, 0.075,
            [1.25 * _factor, FLAME_SIZE * _factor],
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]],
            [2 + random 1], 1, 0, "", "", _vehicle
        ];
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + random 0.2) * _factor,
            _ringOrigin,
            [_dir, 0, 0],
            0, 10, 7.9, 0.075,
            [1.25 * _factor, FLAME_SIZE * _factor],
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]],
            [2 + random 1], 1, 0, "", "", _vehicle
        ];
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + random 0.2) * _factor,
            _ringOrigin,
            [-_dir, 0, 0],
            0, 10, 7.9, 0.075,
            [1.25 * _factor, FLAME_SIZE * _factor],
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]],
            [2 + random 1], 1, 0, "", "", _vehicle
        ];

        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + random 0.2) * _factor,
            _ringOrigin,
            [_dir, _dir, 0],
            0, 10, 7.9, 0.075,
            [1.25 * _factor, FLAME_SIZE * _factor],
            [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]],
            [2 + random 1], 1, 0, "", "", _vehicle
        ];

        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + (random 0.2)) * _factor,
            _ringOrigin,
            [-_dir, -_dir, 0],
            0, 10, 7.9, 0.075,
            [1.25 * _factor, FLAME_SIZE * _factor],
            [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]],
            [2 + random 1], 1, 0, "", "", _vehicle
        ];

        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + (random 0.2)) * _factor,
            _ringOrigin,
            [_dir, -_dir, 0],
            0, 10, 7.9, 0.075,
            [1.25 * _factor, FLAME_SIZE * _factor],
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]],
            [2 + random 1], 1, 0, "", "", _vehicle
        ];

        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + random 0.2) * _factor,
            _ringOrigin,
            [-_dir, _dir, 0],
            0, 10, 7.9, 0.075,
            [1.25 * _factor, FLAME_SIZE * _factor],
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]],
            [2 + random 1], 1, 0, "", "", _vehicle
        ];
    };

    (getVehicleTIPars _vehicle) params ["_tiEngine", "_tiWheels", "_tiWeapon"];

    // Formula is designed to have the temperature ramp up quickly and then level out
    _vehicle setVehicleTIPars [
        (_tiEngine + _intensity * 0.01) / 1.005,
        (_tiWheels + _intensity * 0.004) / 1.002, // Wheels/tracks are further away from burning parts
        (_tiWeapon + _intensity * 0.01) / 1.005
    ];
}, 0, [_vehicle, _jet, _ring, _startTime, _duration, _light, _fireSelection, _sound, _intensity, _fireKey]] call CBA_fnc_addPerFrameHandler;
