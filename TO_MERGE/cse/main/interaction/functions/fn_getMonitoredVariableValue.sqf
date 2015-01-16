/**
 * fn_getMonitoredVariableValue.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_target","_returnValue","_stagingName","_variable"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_variable = [_this,1,"",[""]] call BIS_fnc_Param;

_returnValue = "";
_stagingName = [_target,_variable] call cse_fnc_getMonitoredVariableName;
_unknown = false;
if (isnil _stagingName) then {
	// default value for variable, else ""
	_returnValue = [_variable] call cse_fnc_getVariableDefault;
	[_target,_variable,_returnValue] call cse_fnc_setMonitoredVariableValue;
	_unknown = true;
} else {
	_returnValue = call compile _stagingName;
	if (isnil "_returnValue") then {
		_returnValue = [_variable] call cse_fnc_getVariableDefault;
		_unknown = true;
	} else {
		if (typeName _returnValue == typeName "") then {
			if (_returnValue == "") then {
				call compile format["%1 = '';",_stagingName];
				player sidechat format["Return didnt function propery"];
			};
			_returnValue = [_variable] call cse_fnc_getVariableDefault;
			_unknown = true;
		};
	};
};
_returnValue