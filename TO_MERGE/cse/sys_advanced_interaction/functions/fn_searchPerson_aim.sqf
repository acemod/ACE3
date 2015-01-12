/*
	NAME: fnc_searchPerson
	USAGE: Opens gear menu of target object for caller
	AUTHOR: Glowbal
	ARGUMENTS: OBJECT unit, OBJECT target
	RETURN: void
*/


private ["_caller","_cursor"];
_caller = _this select 0;
_cursor = _this select 1;

if ([_caller, _cursor] call cse_fnc_searchPersonCondition_AIM) then {
	_caller action ["GEAR", _cursor];
};