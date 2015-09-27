/*
 * Author: Glowbal
 * Check in cfgPatches if modification is loaded
 *
 * Arguments:
 * 0: Mod Name or Classname of the mod in cfgPatches <STRING>
 *
 * Return Value:
 * if modification is loaded <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_modName"];

isClass (configFile >> "cfgPatches" >> _modName) // return
