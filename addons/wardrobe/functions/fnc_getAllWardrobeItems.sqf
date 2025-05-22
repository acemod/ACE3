#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Debug - Function to retrieve all existing Wardrobe items.
 *
 * Arguments:
 * 0: Return as config? <BOOL> (default: false)
 *
 * Return Value:
 * Wardobe items, either as classname or config <ARRAY>
 *
 * Example:
 * true call ace_wardrobe_fnc_getAllWardrobeItems;
 * [this, flatten ([] call ace_wardrobe_fnc_getAllWardrobeItems)] call ace_arsenal_fnc_initBox;
 *
 * Public: Yes
 */


params [["_asConfig", false, [true]]];

private _return = flatten ( ["CfgWeapons", "CfgGlasses"] apply { ( QUOTE(_x call FUNC(isModifiable)) configClasses (configFile >> _x) ) } );

if (_asConfig) then { _return } else { _return apply { configName _x } }
