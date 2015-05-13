/*
 * Author: commy2
 * Get the index of the weapon.
 * 0 = primary, 1 = secondary, 2 = handgun, -1 = other
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return value:
 * Weapon index <NUMBER>
 *
 * Public: No
 */
 #include "script_component.hpp"

PARAMS_2(_unit,_weapon);

if (_weapon == "") exitWith {-1};

[
    primaryWeapon _unit,
    secondaryWeapon _unit,
    handgunWeapon _unit
] find _weapon
