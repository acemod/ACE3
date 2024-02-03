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
