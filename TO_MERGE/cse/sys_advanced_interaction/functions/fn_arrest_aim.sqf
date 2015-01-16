/*
	NAME: fnc_setArrested
	USAGE: switches state of unit to arrested
	AUTHOR: Glowbal
	ARGUMENTS: OBJECT unit, OBJECT target , of type man
	RETURN: void
*/


private ["_caller","_cursor"];
_caller = _this select 0;
_target = _this select 1;

playSound "cse_cable_tie_zipping";

[_target, true] call cse_fnc_setArrestState;
hint format["You arrrest this person"];

if (CSE_USE_EQUIPMENT_AIM) then {
	[_caller, "cse_Keycuffs", false] call cse_fnc_useItem;
};
