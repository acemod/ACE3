#include "script_component.hpp"
/*
 * Author: mjc4wilton
 * Handle BI arsenal opening
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_gunbag_fnc_BIArsenalOpen
 *
 * Public: No
 */

if ([player] call FUNC(hasGunBag)) then {
    GVAR(arsenalCache) = (backpackContainer player) getVariable [QGVAR(gunbagWeapon), []];
};
