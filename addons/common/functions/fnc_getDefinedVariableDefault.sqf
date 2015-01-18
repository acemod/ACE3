/**
 * fn_getvariableDefault.sqf
 * @Descr: Get the variable default value
 * @Author: Glowbal
 *
 * @Arguments: [variableName STRING]
 * @Return: ANY
 * @PublicAPI: true
 */

#include "script_component.hpp"

private "_variableDefinition";
_variableDefinition = ([_this select 0] call FUNC(getDefinedVariableInfo));
if (count _variableDefinition > 0) exitwith {
    _variableDefinition select 1;
};

nil;