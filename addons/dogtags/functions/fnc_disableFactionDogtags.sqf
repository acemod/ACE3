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
#include "script_component.hpp"

params [["_faction", "", [""]]];

if (isNil QGVAR(disabledFactions)) then {
    GVAR(disabledFactions) = [] call CBA_fnc_createNamespace;
};

GVAR(disabledFactions) setVariable [_faction, true];
