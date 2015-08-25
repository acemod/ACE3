/*
 * Author: Glowbal
 * Get the variable default value
 *
 * Arguments:
 * 0: Variable Name <STRING>
 *
 * Return Value:
 * Default value of variable <ANY>
 *
 * Public: Yes
 */
#include "script_component.hpp"

private "_variableDefinition";

params ["_variableName"];

_variableDefinition = ([_variableName] call FUNC(getDefinedVariableInfo));
if (count _variableDefinition > 0) exitWith {
    _variableDefinition select 1
};

nil
