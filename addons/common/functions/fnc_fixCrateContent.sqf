/*
 * Author: commy2
 * Fixes zeus placed crates containing buged mine detectors and ace items.
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_crate"];

private ["_weapons", "_items"];

// get all weapons inside the crate
_weapons = weaponCargo _crate;
_items = [];

// if the "weapon" is supposed to be an item, move those from the weapon array to the item array
{
    if (getText (configFile >> "CfgWeapons" >> _x >> "simulation") == "ItemMineDetector") then {
        _weapons set [_forEachIndex, ""];
        _items pushBack _x;
    };
} forEach _weapons;

_weapons = _weapons - [""];

// exit now if everything is fine
if (count _items == 0) exitWith {};

// otherwise clear weapon cargo and re-add items and weapons
clearWeaponCargoGlobal _crate;

{
    _crate addWeaponCargoGlobal [_x, 1];
} forEach _weapons;

{
    _crate addItemCargoGlobal [_x, 1];
} forEach _items;
