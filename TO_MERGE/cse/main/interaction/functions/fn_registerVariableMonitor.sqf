/**
 * fn_registerVariableMonitor.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_target","_varName","_register","_onUpdate","_registerMonitor"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_target = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_Param;
_varName = _this select 2;
_onUpdate = "";
if (count _this >3) then {
	_onUpdate = _this select 3;
	[_target,_varName,_onUpdate] call cse_fnc_setOnUpdateVariableEH;
};
if (local _unit) then {
	if (isnil "CSE_REGISTERED_MONITORED_VARIABLES") then {
		CSE_REGISTERED_MONITORED_VARIABLES = [];
	};
	CSE_REGISTERED_MONITORED_VARIABLES pushback _varName;
	[_target,_varName] call cse_fnc_getMonitoredVariableValue;
};

if (!local _target) exitwith {
	[_this, "cse_fnc_registerVariableMonitor",owner _target, false] spawn BIS_fnc_MP;
};
_registerMonitor = [_target,"cse_variableMonitor",[]] call cse_fnc_getVariable;
_registerMonitor pushback [_unit,_varName];
[_target,"cse_variableMonitor",_registerMonitor] call cse_fnc_setVariable;
// [[_target,_varName,([_target,_varName] call cse_fnc_getVariable)], "cse_fnc_setMonitoredVariableValue", _unit, false] spawn BIS_fnc_MP;