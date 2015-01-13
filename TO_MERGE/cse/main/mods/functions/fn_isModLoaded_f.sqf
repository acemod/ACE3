/**
 * fn_isModLoaded_f.sqf
 * Descr: Check in cfgPatches if modification is loaded
 * Author: Glowbal
 *
 * Arguments: [modName STRING (Classname of the mod in cfgPatches)]
 * Return: BOOL true if modification is loaded
 * PublicAPI: true
 */

private ["_modName"];
_modName = [_this, 0, "",[""]] call BIS_fnc_Param;

(isClass (configFile >> "cfgPatches" >> _modName))