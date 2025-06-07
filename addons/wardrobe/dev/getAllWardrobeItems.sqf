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
 * call compile preprocessFileLineNumbers "z\ace\addons\wardrobe\dev\getAllWardrobeItems.sqf";
 *
 * Public: No
 */

params ["_asConfig", false, [false]];

private _return = [];

{
    _return append (QUOTE(_x call FUNC(isModifiable)) configClasses (configFile >> _x));
} forEach ["CfgWeapons", "CfgGlasses"];

if (_asConfig) then {
    _return apply { configName _x } // return
} else {
    _return
}
