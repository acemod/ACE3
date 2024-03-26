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
    // Plays a sound locally, so that different sounds can be used for various distances
    [QGVAR(playCookoffSound), {
        params ["_object", "_sound"];

        if (isNull _object) exitWith {};

        private _distance = _object distance (positionCameraToWorld [0, 0, 0]);

        TRACE_3("",_object,_sound,_maxDistance);

        // 3 classes of distances: close, mid and far, each having different sound files
        private _classDistance = switch (true) do {
            case (_distance < DISTANCE_CLOSE): {"close"};
            case (_distance < DISTANCE_MID): {"mid"};
            default {"far"};
        };

        _sound = format [QGVAR(%1_%2_%3), _sound, _classDistance, floor (random 3) + 1];

        TRACE_1("",_sound);

        // Allows other mods to change sounds for cook-off
        _sound = getArray (configFile >> "CfgSounds" >> _sound >> "sound");

        if (_sound isEqualTo []) exitWith {};

        _sound params ["_sound", "_volume", "_pitch", "_maxDistance"];

        if (_distance > _maxDistance) exitWith {};

        // Make sure file exists, so RPT isn't spammed with non-existent entry errors
        if (!fileExists _sound) exitWith {};

        // Obeys speed of sound and takes doppler effects into account
        playSound3D [_sound, objNull, insideBuilding _object >= 0.5, getPosASL _object, _volume, _pitch + (random 0.2) - 0.1, _maxDistance, 0, true];
    }] call CBA_fnc_addEventHandler;
};
