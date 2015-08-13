/*
 * Author: Glowbal
 * Get the variable default value
 *
 * Arguments:
 * 0: Variable Name (STRING)
 *
 * Return Value:
 * The Default Value that the Variable has (ANY)
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_variableName"];

private "_variableDefinition";
_variableDefinition = ([_variableName] call FUNC(getDefinedVariableInfo));
if (count _variableDefinition > 0) exitwith {
    _variableDefinition select 1;
};

nil;
