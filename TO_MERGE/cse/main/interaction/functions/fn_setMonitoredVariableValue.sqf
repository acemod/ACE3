/**
 * fn_setMonitoredVariableValue.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

_this spawn {
	private ["_unit","_target","_variable","_eh"];
	_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
	_variable = [_this,1,"",[""]] call BIS_fnc_Param; 1;

	_stagingName = [_target,_variable] call cse_fnc_getMonitoredVariableName;
	if (count _this >2) then {
		call compile format["%1 = %2;",_stagingName,_this select 2];
	} else {
		call compile format["%1 = nil;",_stagingName];
	};


	_eh = [_target,_variable] call cse_fnc_getOnUpdateVariableEH;
	if (!isnil _eh) then {
		if (typeName _eh == typeName "") then {
			[_target,_variable,_this select 2] spawn compile _eh;
		} else {
			if (typeName _eh == typeName {}) then {
				[_target,_variable,_this select 2] spawn _eh;
			};
		};
	};

};