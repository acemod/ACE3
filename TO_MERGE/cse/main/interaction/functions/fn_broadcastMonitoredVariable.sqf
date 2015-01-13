/**
 * fn_broadcastMonitoredVariable.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_target","_variable","_owners"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_variable = [_this,1,"",[""]] call BIS_fnc_Param;

if (_variable == "cse_variableMonitor" || _variable == "cse_interactionRegister") exitwith{};

if (!local _target) exitwith {
	[_this, "cse_fnc_broadcastMonitoredVariable",owner _target, false] spawn BIS_fnc_MP;
};
_owners = ([_target,_variable] call cse_fnc_getRegisteredMonitorVariablesOwners);
{
	[_this, "cse_fnc_setMonitoredVariableValue",owner _x, false] spawn BIS_fnc_MP;
}foreach _owners;