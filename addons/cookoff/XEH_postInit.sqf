#include "script_component.hpp"

[QGVAR(cookOff), LINKFUNC(cookOff)] call CBA_fnc_addEventHandler;
[QGVAR(cookOffBoxLocal), LINKFUNC(cookOffBoxLocal)] call CBA_fnc_addEventHandler;
[QGVAR(cookOffEffect), LINKFUNC(cookOffEffect)] call CBA_fnc_addEventHandler;
[QGVAR(engineFireLocal), LINKFUNC(engineFireLocal)] call CBA_fnc_addEventHandler;
[QGVAR(smoke), LINKFUNC(smoke)] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(cookOffBox), LINKFUNC(cookOffBox)] call CBA_fnc_addEventHandler;
    [QGVAR(engineFire), LINKFUNC(engineFire)] call CBA_fnc_addEventHandler;
    [QGVAR(detonateAmmunition), LINKFUNC(detonateAmmunition)] call CBA_fnc_addEventHandler;
};

// Handle cleaning up effects when vehicle is deleted mid cook-off
[QGVAR(addCleanupHandlers), {
    // No effects on machines without interfaces
    if (!hasInterface) exitWith {};

    params ["_object"];

    // Don't add a new EH if cook-off is run multiple times
    if (!isNil {_object getVariable QGVAR(deletedEH)}) exitWith {};

    _object setVariable [QGVAR(deletedEH),
        _object addEventHandler ["Deleted", {
            [QGVAR(cleanupEffects), _this select 0] call CBA_fnc_localEvent;
        }]
    ];
}] call CBA_fnc_addEventHandler;

[QGVAR(cleanupEffects), {
    params ["_object", ["_effects", []]];

    if (isServer) then {
        // Reset, so that object can cook-off again
        _object setVariable [QGVAR(isCookingOff), nil, true];

        // Remove effects from JIP
        private _jipID = _object getVariable QGVAR(jipID);

        if (isNil "_jipID") exitWith {};

        _jipID call CBA_fnc_removeGlobalEventJIP;

        _object setVariable [QGVAR(jipID), nil];
    };

    // No effects on machines without interfaces
    if (!hasInterface) exitWith {};

    // All effects are local
    _effects append (_object getVariable [QGVAR(effects), []]);

    if (_effects isEqualTo []) exitWith {};

    {
        deleteVehicle _x;
    } forEach _effects;

    _object setVariable [QGVAR(effects), nil];
}] call CBA_fnc_addEventHandler;

["ReammoBox_F", "init", {
    // Calling this function inside curly brackets allows the usage of "exitWith", which would be broken with "HandleDamage" otherwise
    (_this select 0) addEventHandler ["HandleDamage", {_this call FUNC(handleDamageBox)}];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

// Secondary explosions
["AllVehicles", "Killed", {
    if (!GVAR(enableAmmoCookoff) || {GVAR(ammoCookoffDuration) == 0}) exitWith {};

    params ["_vehicle", "", "", "_useEffects"];

    if (_useEffects && {_vehicle getVariable [QGVAR(enableAmmoCookoff), true]}) then {
        [QGVAR(detonateAmmunition), [_vehicle, false, objNull, objNull, (random MAX_AMMO_DETONATION_START_DELAY) max MIN_AMMO_DETONATION_START_DELAY]] call CBA_fnc_serverEvent;
    };
}, nil, ["CAManBase", "StaticWeapon"]] call CBA_fnc_addClassEventHandler;

if (hasInterface) then {
    // Plays a sound locally, so that different sounds can be used for various distances
    [QGVAR(playCookoffSound), {
        params ["_object", "_sound"];

        if (isNull _object) exitWith {};

        private _distance = _object distance (positionCameraToWorld [0, 0, 0]);

        TRACE_2("",_object,_sound);

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
