/*
 * Author: voiper
 * Check a unit for whether they're carrying a chemlight shield and a chemlight.
 *
 * Arguments:
 * 0: Unit to check <OBJECT>
 *
 * Return value:
 * Flashlight classnames (empty for none) <ARRAY>
 *
 * Example:
 * [unit] call ace_flashlights_fnc_getShieldComponents;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

private _components = [];
private _items = itemsWithMagazines _unit;

if !("ACE_Chemlight_Shield" in _items) exitWith {_components};

{
    if ((_x isKindOf ["Chemlight_green", configFile >> "CfgMagazines"]) && (getText (configFile >> "CfgMagazines" >> _x >> "ACE_ChemlightShieldType") != "") && !(_x in _components)) then {
        _components pushBack _x;
    };
} forEach _items;

_components