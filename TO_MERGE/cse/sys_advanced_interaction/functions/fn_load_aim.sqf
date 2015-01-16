/*
	fnc_load.sqf
	Usage: loads specified unit into a vehicle
	Author: Glowbal

	Arguments: array [unit (object), unit (object)]
	Returns: none

	Affects:
	Executes:
*/

private ["_caller", "_unit","_vehicle", "_loaded"];
_caller = _this select 0;
_unit = _this select 1;

if (!([_unit] call cse_fnc_isArrested)) exitwith {
	hintSilent "This player is awake and cannot be loaded";
};

_vehicle = [_caller, _unit] call cse_fnc_loadPerson_F;
if (!isNull _vehicle) then {
	_loaded = _vehicle getvariable ["cse_loaded_detainees_AIM",[]];
	_loaded pushback _unit;
	_vehicle setvariable ["cse_loaded_detainees_AIM",_loaded,true];

	if (!isnil "CSE_DROP_ADDACTION_AIM") then {
		_caller removeAction CSE_DROP_ADDACTION_AIM;
		CSE_DROP_ADDACTION_AIM = nil;
	};
};