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

if (is3DEN) exitWith {};

if (!isNil QGVAR(arsenalCache)) then {
    (backpackContainer player) setVariable [QGVAR(gunbagWeapon),GVAR(arsenalCache), true];
};

GVAR(arsenalCache) = nil;
