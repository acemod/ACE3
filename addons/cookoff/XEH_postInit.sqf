#include "script_component.hpp"

GVAR(flareHash) = createHashMap;

[QGVAR(cookOffBoxLocal), LINKFUNC(cookOffBoxLocal)] call CBA_fnc_addEventHandler;
[QGVAR(cookOffLocal), LINKFUNC(cookOffLocal)] call CBA_fnc_addEventHandler;
[QGVAR(engineFireLocal), LINKFUNC(engineFireLocal)] call CBA_fnc_addEventHandler;
[QGVAR(smoke), LINKFUNC(smoke)] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(cookOffBoxServer), LINKFUNC(cookOffBoxServer)] call CBA_fnc_addEventHandler;
    [QGVAR(cookOffServer), LINKFUNC(cookOffServer)] call CBA_fnc_addEventHandler;
    [QGVAR(detonateAmmunitionServer), LINKFUNC(detonateAmmunitionServer)] call CBA_fnc_addEventHandler;
    [QGVAR(engineFireServer), LINKFUNC(engineFireServer)] call CBA_fnc_addEventHandler;
};

// Handle cleaning up effects when objects are deleted mid cook-off
["AllVehicles", "Deleted", {
    deleteVehicle ((_this select 0) getVariable [QGVAR(effects), []]);
}, true, ["Man", "StaticWeapon"], true] call CBA_fnc_addClassEventHandler; // Use "Man" to exclude animals as well

["ReammoBox_F", "Deleted", {
    deleteVehicle ((_this select 0) getVariable [QGVAR(effects), []]);
}, true, [], true] call CBA_fnc_addClassEventHandler;

// Raised when the flames have subsided or after the ammo of a box has finished cooking off
[QGVAR(cleanupEffects), {
    params ["_object"];

    deleteVehicle (_object getVariable [QGVAR(effects), []]);

    _object setVariable [QGVAR(effects), nil];
}] call CBA_fnc_addEventHandler;

// Ammo box damage handling
["ReammoBox_F", "init", {
    // Calling this function inside curly brackets allows the usage of "exitWith", which would be broken with "HandleDamage" otherwise
    (_this select 0) addEventHandler ["HandleDamage", {call FUNC(handleDamageBox)}];
}, true, [], true] call CBA_fnc_addClassEventHandler;

// Vehicle ammo cook-off (secondary explosions)
["AllVehicles", "Killed", {
    if (!GVAR(enableAmmoCookoff) || {GVAR(ammoCookoffDuration) == 0}) exitWith {};

    params ["_vehicle", "", "", "_useEffects"];

    if (_useEffects && {_vehicle getVariable [QGVAR(enableAmmoCookoff), true]}) then {
        // We don't need to pass source and instigator, as vehicle is already dead
        [QGVAR(detonateAmmunitionServer), [
            _vehicle,
            false,
            objNull,
            objNull,
            random [MIN_AMMO_DETONATION_START_DELAY, (MIN_AMMO_DETONATION_START_DELAY + MAX_AMMO_DETONATION_START_DELAY) / 2, MAX_AMMO_DETONATION_START_DELAY]
        ]] call CBA_fnc_serverEvent;
    };
}, true, ["Man", "StaticWeapon"], true] call CBA_fnc_addClassEventHandler; // Use "Man" to exclude animals as well

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
        playSound3D [_sound, objNull, false, getPosASL _object, _volume, _pitch + (random 0.2) - 0.1, _maxDistance, 0, true];
    }] call CBA_fnc_addEventHandler;
};
