#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Detaches child from parent, and gives rope item back
 *
 * Arguments:
 * 0: Parent <OBJECT>
 * 1: Child <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_towing_fnc_detach
 *
 * Public: No
 */
params ["_unit", "_parent", "_child"];
TRACE_3("detach",_unit,_parent,_child);

private _hook = _child getVariable [QGVAR(hook), objNull];

_parent removeEventHandler ["Deleted", _hook getVariable QGVAR(parentDeleteEventHandler)];
_hook setVariable [QGVAR(parentDeleteEventHandler), -1];

_child removeEventHandler ["Deleted", _hook getVariable QGVAR(childDeleteEventHandler)];
_hook setVariable [QGVAR(childDeleteEventHandler), -1];

_parent removeEventHandler ["RopeBreak", _parent getVariable QGVAR(ropeBreakEventHandler)];
_parent setVariable [QGVAR(ropeBreakEventHandler), -1];

private _rope = _child getVariable [QGVAR(rope), objNull];
ropeDestroy _rope;

private _ropeClass = _hook getVariable [QGVAR(ropeClass), ""];
deleteVehicle _hook;

TRACE_1("rope",_ropeClass);

if (_ropeClass isNotEqualTo "") then {
    [_unit, _ropeClass, true] call CBA_fnc_addItem;
};

[QGVAR(setTowParent), [objNull, _child], _child] call CBA_fnc_targetEvent;

_child setVariable [QGVAR(towing), false, true];
_parent setVariable [QGVAR(towing), false, true];

