/**
 * fn_unregisterInteractingWith.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_target","_register","_toRemove","_newRegister","_registerMonitor"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_target = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_Param;

if (local _unit) then {
	[_unit,"cse_interactionTarget"] call cse_fnc_setVariable;
	{
		_name = [_target, _x] call cse_fnc_getMonitoredVariableName;
		call compile format["%1 = nil;",_name];
	}foreach (call cse_fnc_getAllMonitoredVariables);
};
if (!local _target) exitwith {
	[_this, "cse_fnc_unregisterInteractingWith",owner _target, false] spawn BIS_fnc_MP;
};
_register = [_target,"cse_interactionRegister",[]] call cse_fnc_getVariable;
_register = _register - [_unit];
[_target,"cse_interactionRegister",_register] call cse_fnc_setVariable;

_registerMonitor = [_target,"cse_variableMonitor",[]] call cse_fnc_getVariable;
_newRegister = [];
{
	if ((_x select 0) == _unit) then {

	} else {
		_newRegister pushback _x;
	};
}foreach _registerMonitor;
[_target,"cse_variableMonitor",_newRegister] call cse_fnc_setVariable;