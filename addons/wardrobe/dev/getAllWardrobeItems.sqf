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

flatten ( ["CfgWeapons", "CfgGlasses"] apply { ( QUOTE(_x call FUNC(isModifiable)) configClasses (configFile >> _x) ) } ) apply { configName _x }
