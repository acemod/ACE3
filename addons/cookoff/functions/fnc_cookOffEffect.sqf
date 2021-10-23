#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Spawn cook-off effects
 *
 * Arguments:
 * 0: Vehicle <Object>
 * 1: Spawn fire jet <Boolean>
 * 2: Spawn fire ring <Boolean>
 * 3: How long effect will last (Max 20 seconds) <Number>
 * 4: What selection will fire originate from <String>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, true, false, 15, "commander_turret"] call ace_cookoff_fnc_cookOffEffect
 *
 * Public: No
 */

params ["_obj", "_jet", "_ring", "_time", "_fireSelection"];
private _light = "#lightpoint" createVehicleLocal [0,0,0];
_light setLightBrightness 5;
_light setLightAmbient [0.8, 0.6, 0.2];
_light setLightColor [1, 0.5, 0.2];
_light lightAttachObject [_obj, [0,0,0]];
_time = 0 max (_time min 20);

private _sound = objNull;
if (isServer) then {
    // ironically biggest performance hit is this. Creating a new sound source takes up aprox 400 milliseconds.
    // I dont think there is an alternative that takes into effect distance and whatever, but if you find one please fix!
    private _soundName = selectRandomWeighted [QGVAR(Sound_low), 0.1, QGVAR(Sound_mid), 0.25, QGVAR(Sound_high), 0.65];
    _sound = createSoundSource [_soundName, position _obj, [], 0];
    
    if (_ring) then {
        private _intensity = 6;
        private _radius = 1.5 * ((boundingBoxReal _obj) select 2);
        [QEGVAR(fire,addFireSource), [_obj, _radius, _intensity, _obj]] call CBA_fnc_localEvent;
    };
};

[{
    params ["_args", "_pfh"];
    _args params ["_obj", "_jet", "_ring", "_time", "_startTime", "_light", "_fireSelection", "_sound"];
    private _elapsedTime = CBA_missionTime - _startTime;
    if (_elapsedTime >= _time) exitWith {
        deleteVehicle _light;
        deleteVehicle _sound;
        [QEGVAR(fire,removeFireSource), [_obj]] call CBA_fnc_globalEvent;
        [_pfh] call CBA_fnc_removePerFrameHandler;
    };
    private _factor = (1 + (_elapsedTime / 2) min 2);
    private _flameSize = 1.5;
    
    if (_elapsedTime > (_time * (3 / 4))) then {
        _factor = _factor * linearConversion [_time * (3 / 4), _time, _elapsedTime, 1, 0.5];
    };
    
    _light setLightBrightness 5 * (_factor / 5);
    
    if (_jet) then {
        private _particlePosition = (_obj selectionPosition _fireSelection) vectorAdd [-0.1 + random 0.2, -0.1 + random 0.2, 0];
    
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "",
            "Billboard",
            1,
            (0.1 + (random 0.2)) * _factor, 
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
            _obj
        ];
        
        // make flame push object into ground to make effect seem more "alive"
        if (!isGamePaused && { local _obj }) then {
            private _force = [0, 0, _factor * -(0.5 min random 1.5) * (0.3 min random 1)] vectorMultiply getMass _obj;
            _obj addForce [_force, vectorUpVisual _obj];
        };
    };
    
    if (_ring) then {
        private _ringOrigin = (_obj selectionPosition _fireSelection) vectorAdd [-0.1 + random 0.2, -0.1 + random 0.2, -1];
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal",16,2,32],
            "", "Billboard", 1, (0.1 + (random 0.2)) * _factor, 
            _ringOrigin,
            [0, 20 * (_factor / 2), 0], 
            0, 10, 7.9, 0.075, 
            [1.25 * _factor, _flameSize * _factor], 
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
            [2 + random 1], 1, 0, "", "", _obj
        ];
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + (random 0.2)) * _factor, 
            _ringOrigin,
            [0, -20 * (_factor / 2), 0], 
            0, 10, 7.9, 0.075, 
            [1.25 * _factor, _flameSize * _factor], 
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
            [2 + random 1], 1, 0, "", "", _obj
        ];
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + (random 0.2)) * _factor, 
            _ringOrigin,
            [20 * (_factor / 2), 0, 0], 
            0, 10, 7.9, 0.075, 
            [1.25 * _factor, _flameSize * _factor], 
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
            [2 + random 1], 1, 0, "", "", _obj
        ];
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + (random 0.2)) * _factor, 
            [-0.1 + random 0.2, -0.1 + random 0.2, -1],
            [-20 * (_factor / 2), 0, 0], 
            0, 10, 7.9, 0.075, 
            [1.25 * _factor, _flameSize * _factor], 
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
            [2 + random 1], 1, 0, "", "", _obj
        ];

        private _dir = 20 * (_factor / 2);
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + (random 0.2)) * _factor, 
            _ringOrigin,
            [_dir, _dir, 0], 
            0, 10, 7.9, 0.075, 
            [1.25 * _factor, _flameSize * _factor], 
            [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
            [2 + random 1], 1, 0, "", "", _obj
        ];
        
        _dir = -20 * (_factor / 2);
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + (random 0.2)) * _factor, 
            _ringOrigin,
            [_dir, _dir, 0], 
            0, 10, 7.9, 0.075, 
            [1.25 * _factor, _flameSize * _factor], 
            [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
            [2 + random 1], 1, 0, "", "", _obj
        ];
        
        _dir = 20 * (_factor / 2);
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal",16,2,32],
            "", "Billboard", 1, (0.1 + (random 0.2)) * _factor, 
            _ringOrigin,
            [_dir, -_dir, 0], 
            0, 10, 7.9, 0.075, 
            [1.25 * _factor, _flameSize * _factor], 
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
            [2 + random 1], 1, 0, "", "", _obj
        ];
        
        _dir = 20 * (_factor / 2);
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 2, 32],
            "", "Billboard", 1, (0.1 + (random 0.2)) * _factor, 
            _ringOrigin,
            [-_dir, _dir, 0], 
            0, 10, 7.9, 0.075, 
            [1.25 * _factor, _flameSize * _factor], 
            [[1, 1, 1, -2], [1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
            [2 + random 1], 1, 0, "", "", _obj
        ];
    };
}, 0, [_obj, _jet, _ring, _time, CBA_missionTime, _light, _fireSelection, _sound]] call cba_fnc_addPerFrameHandler;

