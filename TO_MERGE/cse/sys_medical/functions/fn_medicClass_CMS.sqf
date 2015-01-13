/**
 * fn_medicClass_CMS.sqf
 * @Descr: Check if a unit is any medical class above normal.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL
 * @PublicAPI: true
 */

private ["_unit","_class","_return"];
_unit = [_this, 0, objNull,[ObjNull]] call BIS_fnc_Param;

if (isnil "CSE_ADVANCED_MEDICAL_ROLES_CMS") exitwith {
	true;
};

if (CSE_ADVANCED_MEDICAL_ROLES_CMS) then {
	_class = [_unit,"cse_medicClass"] call cse_fnc_getVariable;
	_return = switch (_class) do {
		case 0: {false};
		case 1: {true};
		case 2: {true};
		default {false};

	};
} else {
	_return = true;
};

_return