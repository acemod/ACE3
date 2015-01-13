/*
fnc_loadLocal.sqf
Usage:
Author: Glowbal

Arguments: array [unit (object), vehicle (object), unit (object)]
Returns:

Affects:
Executes:
*/

private ["_unit","_vehicle","_caller","_handle","_loaded"];
_unit = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_vehicle = [_this, 1, ObjNull,[ObjNull]] call BIS_fnc_Param;
_caller = [_this, 2, ObjNull,[ObjNull]] call BIS_fnc_Param;

_unit moveInCargo _vehicle;
_loaded = _vehicle getvariable ["cse_loaded_detainees_AIM",[]];
_loaded pushback _unit;
_vehicle setvariable ["cse_loaded_detainees_AIM",_loaded,true];
if (!([_unit] call cse_fnc_isAwake)) then {
	_handle = [_unit,_vehicle] spawn {
		private ["_unit","_vehicle"];
		_unit = _this select 0;
		_vehicle = _this select 1;
		waituntil {vehicle _unit == _vehicle};
		[_unit,([_unit] call cse_fnc_getDeathAnim)] call cse_fnc_broadcastAnim;
	};
};