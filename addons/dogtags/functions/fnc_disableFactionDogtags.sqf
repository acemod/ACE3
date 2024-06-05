#include "..\script_component.hpp"
/*
 * Author: commy2
 * Disable this faction from using dogtags.
 *
 * Arguments:
 * 0: Faction <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * "CIV_F" call ace_dogtags_fnc_disableFactionDogtags
 *
 * Public: Yes
 */

params [["_faction", "", [""]]];

_faction = configName (configFile >> "CfgFactionClasses" >> _faction);

// Faction doesn't exist
if (_faction == "") exitWith {};

GVAR(disabledFactions) set [_faction, true];
