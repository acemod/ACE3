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

params ["_modName"];

(isClass (configFile >> "cfgPatches" >> _modName))
