/*
 * Author: voiper
 * Check a unit for whether they're carrying prepared chemlight shields.
 *
 * Arguments:
 * 0: Unit to check <OBJECT>
 *
 * Return value:
 * Chemlight classnames (empty for none) <ARRAY>
 *
 * Example:
 * [unit] call ace_chemlights_fnc_getShields;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

private _shields = [];
private _items = items _unit;

{
    if ((_x isKindOf ["ACE_Chemlight_Shield_Green", configFile >> "CfgWeapons"]) && !(_x in _shields)) then {
        _shields pushBack _x;
    };
} forEach _items;

_shields