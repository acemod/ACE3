#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Debug - Script to retrieve all existing Wardrobe items.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Wardobe items, either as classname or config <ARRAY>
 *
 * Example:
 * true call ace_wardrobe_fnc_getAllWardrobeItems;
 * call compile preprocessFileLineNumbers "z\ace\addons\wardrobe\dev\getAllWardrobeItems.sqf";
 *
 * Public: Yes
 */

private _return = [];

{
    _return append (QUOTE(_x call FUNC(isModifiable)) configClasses (configFile >> _x));
} forEach ["CfgWeapons", "CfgGlasses"];

_return apply { configName _x } // return
