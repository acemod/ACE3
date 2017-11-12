/*
 * Author: voiper
 * Check a unit for whether they're carrying a chemlight shield and a chemlight.
 *
 * Arguments:
 * 0: Unit to check <OBJECT>
 *
 * Return Value:
 * List of carried chemlight classnames <ARRAY>
 *
 * Example:
 * [ACE_player] call ace_chemlights_fnc_getShieldComponents;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];
private _components = [];
private _items = itemsWithMagazines _unit;

if !("ACE_Chemlight_Shield" in _items) exitWith {_components};

{
    if ((_x isKindOf ["Chemlight_green", configFile >> "CfgMagazines"]) && {getText (configFile >> "CfgMagazines" >> _x >> "ACE_Chemlight_Shield") != ""}) then {
        _components pushBackUnique _x;
    };
} forEach _items;

_components
