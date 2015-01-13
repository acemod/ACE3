/**
 * fn_getRegisteredMonitorVariablesOwners.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_target","_returnOwners","_register","_variableName","_registerMonitorCol"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_variableName = [_this,1,"",[""]] call BIS_fnc_Param;
_returnOwners = [];

_registerMonitorCol = + ([_target,"cse_variableMonitor",[]] call cse_fnc_getVariable);

//if (count _registerMonitor > 0) then {
	{
		if ((_x select 1) == _variableName) then {
			_returnOwners pushback (_x select 0);
		};
	}foreach _registerMonitorCol;
//};
_returnOwners