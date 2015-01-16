/**
 * fn_getMonitoredVariableName.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_target","_stagingName","_name","_variableName"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_variableName = [_this,1,"",[""]] call BIS_fnc_Param;
//_name = "";
//{
//	_name = _name + _x;
//}foreach ([format["%",_target], " "] call BIS_fnc_splitString);

_stagingName = format["CSE_MONITORED_VARIABLE_%1", _variableName];
_stagingName