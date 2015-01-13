/*
	NAME: fnc_searchPersonCondition
	USAGE: Checks if caller can search target
	AUTHOR: Glowbal
	ARGUMENTS: OBJECT unit, OBJECT target
	RETURN: boolean
*/



private ["_caller","_cursor", "_return"];
_caller = _this select 0;
_cursor = _this select 1;
_return = false;

if (group _caller != group _cursor && {_cursor iskindof "CaManBase"} && {_cursor distance _caller < 5}) then {
	_return = true;
};

_return
