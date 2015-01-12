/**
 * fn_findTargetOfMenu_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_type", "_target","_carriedObj","_allowed"];
_type = [_this, 0, 0,[0]] call BIS_fnc_Param;
_allowedClasses = [_this, 1, ["all"],[[]]] call BIS_fnc_Param;

if (vehicle player != player) exitwith {
	vehicle player;
};

_target = switch (_type) do {
	case 2: {if (isNull cursortarget) then {player} else{cursortarget};};
	case 1: {cursortarget};
	case 0: {player};
	default {ObjNull};
};



if ((_target distance player) > 10 && {(_type == 2)}) then {
	_target = player;
};
if (_target != player) then {
	_carriedObj = [player] call cse_fnc_getCarriedObj;
	if (!isNull _carriedObj) then {
		_target = _carriedObj;
	};
};
_allowed = false;
{
	if (_target isKindOf _x) exitwith {
		_allowed = true;
	};
}foreach _allowedClasses;
if (!_allowed) then {
	_target = ObjNull;
};
_target