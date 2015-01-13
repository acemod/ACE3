/**
 * fn_setOnUpdateVariableEH.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_target","_name","_eh","_variableName"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_variableName = [_this,1,"",[""]] call BIS_fnc_Param;
_eh = _this select 2; // what data type?
_name = [_target,_variableName] call cse_fnc_getMonitoredVariableName;
_name = _name + "_UPDATE_EH";
[_eh] call compile format["%1 = (_this select 0);",_name,_eh];