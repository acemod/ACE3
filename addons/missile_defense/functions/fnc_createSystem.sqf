#include "..\script_component.hpp"
/*
 * Author: Brett Mayson
 * Create a missile defense system.
 *
 * Arguments:
 * 0: Sides - The sides that the missile defense system will engage. If not provided, it will engage all sides. <ARRAY of SIDEs>
 * 1: ID - Optional, The ID of the missile defense system to create. <STRING>
 *
 * Return Value:
 The ID of the created missile defense system. <STRING>
 *
 * Example:
 * [] call ace_missile_defense_fnc_createSystem
 *
 * Public: Yes
 */

params ["_sides", ["_id", ""]];

if (!isServer) exitWith {
    ERROR("missile_defense functions only run on server");
};

if (_id == "") then {
    _id = format ["%1-%2", diag_tickTime, count GVAR(systems)];
};

if (_id in GVAR(systems)) exitWith {
    ERROR_1("Missile defense system with ID '%1' already exists",_id);
};

GVAR(systems) set [_id, createHashMapFromArray [
    ["trackers", []],
    ["launchers", []],
    ["interceptors", []],
    ["sides", _sides],
    ["conditions", []],
    ["targets_possible", []],
    ["targets_pending", []],
    ["targets_tracking", []]
]];

if (isNil QGVAR(systemIndex)) then {
    GVAR(systemIndex) = 0;
    [LINKFUNC(systemPFH)] call CBA_fnc_addPerFrameHandler;
    [LINKFUNC(interceptorPFH)] call CBA_fnc_addPerFrameHandler;
};

TRACE_1("Registered missile defense system",_id);

[QGVAR(startTracking), []] call CBA_fnc_globalEventJIP;

_id
