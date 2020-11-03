#include "script_component.hpp"
/*
 * Author: mjc4wilton
 * Handle BI arsenal closing
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_gunbag_fnc_BIArsenalClose
 *
 * Public: No
 */

params ["_unit"];

if (!isNil QGVAR(arsenalCache)) then {
    backpackContainer _unit setVariable [QGVAR(gunbagWeapon), GVAR(arsenalCache), true];
};

GVAR(arsenalCache) = nil;

nil
