/**
 * fn_getVariable.sqf
 * @Descr: Grabs a variable. If variable has not been set, attempts to use default defined value
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, variableName STRING]
 * @Return: ANY
 * @PublicAPI: true
 */

#define UNIT (_this select 0)
#define VARIABLE (_this select 1)

private "_value";

_value = UNIT getvariable VARIABLE;
if (isnil "_value") then {
	if (count _this >2) then {
		_value = _this select 2;
	} else {
		private "_definedVariable";
		_definedVariable = ([VARIABLE] call cse_fnc_getVariableInfo);
		if (count _definedVariable > 1) then {
			_value = _definedVariable select 1;
		};
	};
	if (isnil "_value") then {
		_value = 0;
	};
};
_value