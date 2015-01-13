/*
fnc_unload.sqf
Usage:
Author: Glowbal

Arguments: array [unit (object), unit (object), vehicle (object)]
Returns:

Affects:
Executes:
*/

private ["_caller", "_unit","_vehicle", "_drag", "_handle"];
_caller = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_unit = [_this, 1, ObjNull,[ObjNull]] call BIS_fnc_Param;
_drag = [_this, 2, false, [false]] call BIS_fnc_Param;

_vehicle = vehicle _unit;
if ([_caller, _unit] call cse_fnc_unloadPerson_F) then {
	_loaded = _vehicle getvariable ["cse_loaded_detainees_AIM",[]];
	_loaded = _loaded - [_unit];
	_vehicle setvariable ["cse_loaded_detainees_AIM",_loaded,true];
	if (_drag) then {
		if ((vehicle _caller) == _caller) then {
			_handle = [_caller, _unit] spawn {
				_caller = _this select 0;
				_unit = _this select 1;
				waituntil {(vehicle _unit == _unit)};
				[[_caller,_unit], "cse_fnc_move_AIM", _caller, false] spawn BIS_fnc_MP;
			};
		};
	};
};