#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Debug - Function to retrieve all existing Wardrobe items.
 *
 * Arguments:
 * 0: Return as Config? <BOOL> (default: false)
 *
 * Return Value:
 * Array Wardobe Items, ether as Classname or as Config <ARRAY>
 *
 * Example:
 * [true] call ace_wardrobe_fnc_getAllWardrobeItems;
 * [this, flatten ([] call ace_wardrobe_fnc_getAllWardrobeItems)] call ace_arsenal_fnc_initBox;
 *
 * Public: Yes
 */


params [["_asConfig", false, [true]]];

private _return = flatten ( ["CfgWeapons", "CfgGlasses"] apply { ( QUOTE([_x] call FUNC(isModifiable)) configClasses (configFile >> _x) ) } );

if (_asConfig) then { _return } else { _return apply { configName _x } }
