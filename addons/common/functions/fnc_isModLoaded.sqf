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

private _key = toLowerANSI _modName;
GVAR(isModLoadedCache) getOrDefaultCall [_key, {isClass (configFile >> "CfgPatches" >> _key )}, true]

if (isNil "_return") then {
    _return = isClass (configFile >> "CfgPatches" >> _modName);
    GVAR(isModLoadedCache) set [_key, _return];
};

_return
