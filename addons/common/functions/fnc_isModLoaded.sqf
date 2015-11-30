/*
 * Author: Glowbal
 * Check in CfgPatches if modification is loaded
 *
 * Arguments:
 * 0: Mod Name or Classname of the mod in CfgPatches <STRING>
 *
 * Return Value:
 * if modification is loaded <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_modName"];

isClass (configFile >> "CfgPatches" >> _modName) // return
