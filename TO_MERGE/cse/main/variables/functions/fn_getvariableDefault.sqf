/**
 * fn_getvariableDefault.sqf
 * @Descr: Get the variable default value
 * @Author: Glowbal
 *
 * @Arguments: [variableName STRING]
 * @Return: ANY
 * @PublicAPI: true
 */

private ["_name","_return"];
_name = _this select 0;
_variableDefinition = ([_name] call cse_fnc_getVariableInfo);
if (count _variableDefinition > 0) then {
	_return = _variableDefinition select 1;
};

_return