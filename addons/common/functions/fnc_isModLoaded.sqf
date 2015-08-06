/*
 * Author: Glowbal
 *
 * Check in cfgPatches if modification is loaded
 *
 * Arguments:
 * 0: Mod Name or Classname of the mod in cfgPatches (STRING)
 * 1: modName STRING
 *
 * Return Value:
 * if modification is loaded (BOOLEAN)
 *
 * Example:
 * isSpecialist = [player] call FUNC(isEOD);
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_modName"];

(isClass (configFile >> "cfgPatches" >> _modName))
