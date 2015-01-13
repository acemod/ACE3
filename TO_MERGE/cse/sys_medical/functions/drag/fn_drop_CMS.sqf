
/*
	fnc_drop.sqf
	Usage: makes the calling unit start dragging the specified unit
	Author: Glowbal

	Arguments: array [unit (object), unit (object)]
	Returns: none

	Affects:
	Executes:
*/

private ["_caller", "_unit","_info","_draggedPerson"];
_caller = _this select 0;
_unit = _this select 1;
[_caller,objNull] call cse_fnc_carryObj;
if (!isnil "CSE_DROP_ADDACTION_CMS") then {
_caller removeAction CSE_DROP_ADDACTION_CMS;
	CSE_DROP_ADDACTION_CMS = nil;
};