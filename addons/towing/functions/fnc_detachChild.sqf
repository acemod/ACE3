#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Detaches child.
 * Run globally.
 *
 * Arguments:
 * 0: Child <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_towing_fnc_detachChild
 *
 * Public: No
 */
params ["_child"];
TRACE_1("detachChild",_child);

_child setTowParent objNull;

if (!isServer) exitWith {};

_child setVariable [QGVAR(parent), objNull, true];
GVAR(allChildren) = GVAR(allChildren) - [_child];

private _childChildHooks = _child getVariable [QGVAR(childHooks), []];
if (_childChildHooks isEqualTo []) then {
    TRACE_1("remove Deleted EH",_child);
    _child removeEventHandler ["Deleted", _child getVariable [QGVAR(DeletedEHID), -1]];
    _child setVariable [QGVAR(DeletedEHID), -1];
};
