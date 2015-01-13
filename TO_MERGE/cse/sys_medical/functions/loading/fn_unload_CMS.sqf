/**
 * fn_unload_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_caller", "_unit","_vehicle", "_drag", "_handle"];
_caller = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_unit = [_this, 1, ObjNull,[ObjNull]] call BIS_fnc_Param;
_drag = [_this, 2, false, [false]] call BIS_fnc_Param;

// cannot unload a unit not in a vehicle.
if (vehicle _unit == _unit) exitwith {};

if (([_unit] call cse_fnc_isAwake)) exitwith {};

_vehicle = vehicle _unit;
if ([_caller, _unit] call cse_fnc_unloadPerson_F) then {
	_loaded = _vehicle getvariable ["cse_loaded_casualties_CMS",[]];
	_loaded = _loaded - [_unit];
	_vehicle setvariable ["cse_loaded_casualties_CMS",_loaded,true];
	if (_drag) then {
		if ((vehicle _caller) == _caller) then {
			_handle = [_caller, _unit] spawn {
				_caller = _this select 0;
				_unit = _this select 1;
				waituntil {(vehicle _unit == _unit)};
				[[_caller,_unit], "cse_fnc_drag_CMS", _caller, false] spawn BIS_fnc_MP;
			};
		};
	};
};