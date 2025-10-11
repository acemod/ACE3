#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Retrieves all existing wardrobe items.
 *
 * Arguments:
 * 0: Return config name instead of config <BOOL> (default: false)
 *
 * Return Value:
 * Wardrobe items, either as classname or config <ARRAY>
 *
 * Example:
 * call compile preprocessFileLineNumbers "z\ace\addons\wardrobe\dev\getAllWardrobeItems.sqf";
 *
 * Public: No
 */

params [["_readName", false, [false]]];

private _return = [];

{
    _return append (QUOTE(_x call FUNC(isModifiable)) configClasses (configFile >> _x));
} forEach ["CfgWeapons", "CfgGlasses"];

if (_readName) then {
    _return apply { configName _x } // return
} else {
    _return
}
