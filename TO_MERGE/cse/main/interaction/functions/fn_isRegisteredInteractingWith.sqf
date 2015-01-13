/**
 * fn_isRegisteredInteractingWith.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_target","_register"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_target = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_Param;
_register = [_target,"cse_interactionRegister",[]] call cse_fnc_getVariable;
_return = false;
{
	if (_x == _unit) exitwith {
		_return = true;
	};
}foreach _register;

_return