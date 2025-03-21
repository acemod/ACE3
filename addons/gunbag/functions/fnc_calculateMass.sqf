#include "..\script_component.hpp"
/*
 * Author: Ir0n1E
 * Calculate mass of weapon and items.
 *
 * Arguments:
 * 0: Weapon <STRING>
 * 1: Items <ARRAY>
 * 2: Magazines <ARRAY>
 *
 * Return Value:
 * Mass <NUMBER>
 *
 * Example:
 * ["weapon", ["item1", "item2"], ["mag1", "mag2"]] call ace_gunbag_fnc_calculateMass
 *
 * Public: No
 */

params ["_weapon", "_items", "_magazines"];

private _mass = getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass");

{
    _mass = _mass + getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
} forEach _items;

{
    _mass = _mass + getNumber (configFile >> "CfgMagazines" >> _x >> "mass");
} forEach _magazines;

_mass
