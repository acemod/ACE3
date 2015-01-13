/*
	NAME: fnc_release
	USAGE: switches state of unit to arrested
	AUTHOR: Glowbal
	ARGUMENTS: OBJECT unit, OBJECT target , of type man
	RETURN: void
*/


private ["_caller","_cursor"];
_caller = _this select 0;
_target = _this select 1;
[_caller,ObjNull] call cse_fnc_carryObj;
[_target, false] call cse_fnc_setArrestState;
hint format["You release this person"];

if (CSE_USE_EQUIPMENT_AIM) then {
	// Disabled, as these are zipties. We would not be getting them back.
//	_caller addItem "cse_Keycuffs";
};