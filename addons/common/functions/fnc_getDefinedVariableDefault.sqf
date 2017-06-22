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
 * Example:
 * ["name"] call ace_common_fnc_getDefinedVariableDefault
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_varName"];

private _variableDefinition = _varName call FUNC(getDefinedVariableInfo);

if !(_variableDefinition isEqualTo []) exitWith {
    _variableDefinition select 1;
};

nil
