/**
 * fn_isModLoaded_f.sqf
 * Descr: Check in cfgPatches if modification is loaded
 * Author: Glowbal
 *
 * Arguments: [modName STRING (Classname of the mod in cfgPatches)]
 * Return: BOOL true if modification is loaded
 * PublicAPI: true
 */

#include "script_component.hpp"

(isClass (configFile >> "cfgPatches" >> (_this select 0)))