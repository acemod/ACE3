/**
 * fn_getOnUpdateVariableEH.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_target","_variable","_name","_return","_variableName"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_variableName = [_this,1,"",[""]] call BIS_fnc_Param;
_name = [_target,_variableName] call cse_fnc_getMonitoredVariableName;
_name = _name + "_UPDATE_EH";
_return = "";
if (isnil _name) then {

} else {
	_return = call compile _name;
	//[format["cse_fnc_getOnUpdateVariableEH %1 | %2",_return, _name]] call cse_fnc_debug;
};
_return