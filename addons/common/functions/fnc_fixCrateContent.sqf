/*
 * Author: commy2
 *
 *
 *
 * Arguments:
 * 0: Crate (Object)
 *
 * Return Value:
 * None
 *
 */
#include "script_component.hpp"

private ["_weapons", "_items"];

params ["_crate"];

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
