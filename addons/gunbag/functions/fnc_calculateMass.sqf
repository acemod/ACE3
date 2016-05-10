/*
 * Author: Ir0n1E
 * calculate mass of weapon an items
 *
 * Arguments:
 * 0: Weapon <STRING>
 * 1: Items <ARRAY>
 *
 * Return Value:
 * Mass <NUMBER>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_weapon","_items"];

private _mass = getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass");

{
  _mass = _mass + getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
} foreach _items;

_mass
