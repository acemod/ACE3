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
 * Example:
 * ["class"] call ace_common_fnc_isModLoaded
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_modName", "", [""]]];

isClass (configFile >> "CfgPatches" >> _modName) // return
