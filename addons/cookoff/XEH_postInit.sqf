#include "script_component.hpp"

[QGVAR(engineFire), FUNC(engineFire)] call CBA_fnc_addEventHandler;
[QGVAR(cookOff), {
    params ["_vehicle"];
    if (local _vehicle) then {
        _this call FUNC(cookOff);
    };
}] call CBA_fnc_addEventHandler;
[QGVAR(cookOffEffect), FUNC(cookOffEffect)] call CBA_fnc_addEventHandler;
[QGVAR(smoke), FUNC(smoke)] call CBA_fnc_addEventHandler;
[QGVAR(cookOffBox), FUNC(cookOffBox)] call CBA_fnc_addEventHandler;

// handle cleaning up effects when vehicle is deleted mid-cookoff
[QGVAR(addCleanupHandlers), {
    params ["_vehicle"];

    // Don't add a new EH if cookoff is run multiple times
    if ((_vehicle getVariable [QGVAR(deletedEH), -1]) == -1) then {
        private _deletedEH = _vehicle addEventHandler ["Deleted", {
            params ["_vehicle"];

            [QGVAR(cleanupEffects), [_vehicle]] call CBA_fnc_localEvent;
        }];

        _vehicle setVariable [QGVAR(deletedEH), _deletedEH];
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(cleanupEffects), {
    params ["_vehicle", ["_effects", []]];

    _effects = _effects + (_vehicle getVariable [QGVAR(effects), []]);
    if (_effects isNotEqualTo []) then {
         { deleteVehicle _x } count _effects;
    };
}] call CBA_fnc_addEventHandler;

["ReammoBox_F", "init", {
    (_this select 0) addEventHandler ["HandleDamage", {
        if ((_this select 0) getVariable [QGVAR(enableAmmoCookoff), GVAR(enableAmmobox)]) then {
            _this call FUNC(handleDamageBox);
        };
    }];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

// secondary explosions
["AllVehicles", "killed", {
    params ["_vehicle", "", "", "_useEffects"];
    if (
        _useEffects &&
        _vehicle getVariable [QGVAR(enableAmmoCookoff), GVAR(enableAmmoCookoff)]
    ) then {
        if (GVAR(ammoCookoffDuration) == 0) exitWith {};
        ([_vehicle] call FUNC(getVehicleAmmo)) params ["_mags", "_total"];

        private _delay = (random MAX_AMMO_DETONATION_START_DELAY) max MIN_AMMO_DETONATION_START_DELAY;
        [FUNC(detonateAmmunition), [_vehicle, _mags, _total], _delay] call CBA_fnc_waitAndExecute;
    };
}, nil, ["Man","StaticWeapon"]] call CBA_fnc_addClassEventHandler;

if (hasInterface) then {
    GVAR(soundObjPool) = [];
    [QFUNC(poolGetObject), {
        private _pooledObject = GVAR(soundObjPool) param [0, [-999, objNull]];
        _pooledObject params ["_time", "_obj"];
        if (isNull _obj || _time >= time) then {
            _obj = "#particlesource" createVehicleLocal [0, 0, 0];
        } else {
            GVAR(soundObjPool) deleteAt 0;
        };
        GVAR(soundObjPool) pushBack [time + 8, _obj];
        _obj; // return
    }] call CBA_fnc_compileFinal;

    [QGVAR(playCookoffSound), {
        params ["_obj", "_sound", "_maxDist"];
        if (isNull _obj) exitWith {};
        private _distance = _obj distance (positionCameraToWorld [0,0,0]);
        if (_distance > _maxDist) exitWith {};

        // Delay sound after Rule of SOS.
        [{
            params ["_obj", "_sound", "_maxDist"];
            private _distance = _obj distance (positionCameraToWorld [0, 0, 0]); // update Value so that distance is correct to the current camera Position
            private _sDistance = _distance + ((random 5) - 2.5);
            private _disStep = [[["far", 1.5], ["mid", 1.3]] select (_sDistance < 952), ["close", 1]] select (_sDistance < 235);
            _sound = format [QGVAR(%1_%2_%3), _sound, _disStep select 0, ceil (random 3)];
            hintSilent _sound;
            // fix for Vanilla Say3d Falloff
            private _value = 1 - (_distance / _maxDist);
            private _fakeValue = linearConversion ([[0, 0.7, _value, 1, 0.8], [0.7, 1, _value, 0.8, 0]] select (_value >= 0.7));
            private _soundSource = call FUNC(poolGetObject);
            _soundSource setPos (getPos _obj);
            _soundSource say3D [_sound, (_distance / _fakeValue) * (_disStep select 1), 0.9 + (random 0.2)];
        }, [_obj, _sound, _maxDist], _distance / SPEED_OF_SOUND] call CBA_fnc_waitAndExecute;
    }] call CBA_fnc_addEventHandler;

    [{
        if (GVAR(soundObjPool) isEqualTo []) exitWith {};
        private _element = GVAR(soundObjPool) param [0, [time, objNull]];
        if (((_element select 0) + 120) < time) then {
            GVAR(soundObjPool) deleteAt 0;
            deleteVehicle (_element select 1);
        };
    }, 0.5] call CBA_fnc_addPerFrameHandler;
};
