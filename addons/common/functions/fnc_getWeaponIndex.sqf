#include "script_component.hpp"
/*
 * Author: commy2
 * Get the index of the weapon.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * Weapon index <NUMBER>
 *   0 = primary
 *   1 = secondary
 *   2 = handgun
 *  -1 = other
 *
 * Example:
 * [bob, "gun"] call ace_common_fnc_getWeaponIndex
 *
 * Public: Yes
 */

params ["_unit", "_weapon"];

if (_weapon == "") exitWith {-1};

[
    primaryWeapon _unit,
    secondaryWeapon _unit,
    handgunWeapon _unit
] find _weapon // return
