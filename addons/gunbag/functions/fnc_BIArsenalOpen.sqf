#include "script_component.hpp"
/*
 * Author: mjc4wilton
 * Handle BI arsenal opening
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_gunbag_fnc_BIArsenalOpen
 *
 * Public: No
 */

params ["_unit"];

if ([_unit] call FUNC(hasGunBag)) then {
    GVAR(arsenalCache) = backpackContainer _unit getVariable [QGVAR(gunbagWeapon), []];
};
