#include "..\script_component.hpp"
/*
 * Author: Brett Mayson
 * Create a missile defense system.
 *
 * Arguments:
 * 0: Sides <ARRAY of SIDEs> - The sides that the missile defense system will engage. If not provided, it will engage all sides.
 * 1: ID <STRING> - Optional, The ID of the missile defense system to create.
 *
 * Return Value:
 * <STRING> - The ID of the created missile defense system.
 *
 * Example:
 * [] call ace_missile_defense_createSystem
 *
 * Public: No
 */

if (!isServer) exitWith {
    ERROR("missile_defense functions only run on server");
};

private _id = if (count _this > 1) then {
    _this select 1
} else {
    format ["%1", diag_tickTime]
};

if (_id in GVAR(systems)) exitWith {
    ERROR_1("Missile defense system with ID '%1' already exists",_id);
};

GVAR(systems) set [_id, createHashMapFromArray [
    ["trackers", []],
    ["launchers", []],
    ["interceptors", []],
    ["sides", _this select 0],
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

_id
