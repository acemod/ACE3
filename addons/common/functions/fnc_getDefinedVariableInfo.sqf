/*
 * Author: Glowbal
 * Get the variable Informations
 *
 * Arguments:
 * 0: Variable Name (STRING)
 *
 * Return Value:
 * the Informations form the defined Variable (ANY)
 *
 * Public: No
 */

#include "script_component.hpp"
+(missionNamespace getvariable [QGVAR(OBJECT_VARIABLES_STORAGE_) + (_this select 0),[]])
