
/*
    fnc_drop.sqf
    Usage: makes the calling unit start dragging the specified unit
    Author: Glowbal

    Arguments: array [unit (object), unit (object)]
    Returns: none

    Affects:
    Executes:
*/

#include "script_component.hpp"

private ["_caller", "_unit","_info","_draggedPerson"];
_caller = _this select 0;
_unit = _this select 1;

if (!isnil QGVAR(DROP_ADDACTION)) then {
	[_caller,objNull] call EFUNC(common,carryObj);
	_caller removeAction GVAR(DROP_ADDACTION);
    GVAR(DROP_ADDACTION) = nil;
};
