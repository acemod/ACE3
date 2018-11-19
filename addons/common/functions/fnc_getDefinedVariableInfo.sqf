#include "script_component.hpp"
/*
 * Author: Glowbal
 * Get the variable Informations
 *
 * Arguments:
 * 0: Variable Name <STRING>
 *
 * Return Value:
 * Variable Metadata <ARRAY>
 *
 * Example:
 * ["var"] call ace_common_fnc_getDefinedVariableInfo
 *
 * Public: No
 */

params ["_varName"];

+ (missionNamespace getVariable [format [QGVAR(OBJECT_VARIABLES_STORAGE_%1), _varName], []])
