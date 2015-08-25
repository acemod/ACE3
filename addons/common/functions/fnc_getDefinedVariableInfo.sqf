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
 * Public: No
 */
#include "script_component.hpp"

params ["_variableName"];

+(missionNamespace getVariable [format [QGVAR(OBJECT_VARIABLES_STORAGE_%1), _variableName], []])
