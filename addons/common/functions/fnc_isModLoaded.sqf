#include "..\script_component.hpp"
/*
 * Author: Glowbal, Grim
 * Check in CfgPatches if modification is loaded
 *
 * Arguments:
 * 0: Classname of the mod in CfgPatches <STRING>
 *
 * Return Value:
 * If modification is loaded <BOOL>
 *
 * Example:
 * "class" call ace_common_fnc_isModLoaded
 *
 * Public: Yes
 */

params [["_modName", "", [""]]];

GVAR(isModLoadedCache) getOrDefaultCall [toLowerANSI _modName, {isClass (configFile >> "CfgPatches" >> _modName)}, true]
