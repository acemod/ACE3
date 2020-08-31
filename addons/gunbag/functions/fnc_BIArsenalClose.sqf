#include "script_component.hpp"
/*
 * Author: mjc4wilton
 * Handle BI arsenal closing
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_gunbag_fnc_BIArsenalClose
 *
 * Public: No
 */

if (!isNil QGVAR(arsenalCache)) then {
    (backpackContainer player) setVariable [QGVAR(gunbagWeapon),GVAR(arsenalCache), true];
};

GVAR(arsenalCache) = nil;
