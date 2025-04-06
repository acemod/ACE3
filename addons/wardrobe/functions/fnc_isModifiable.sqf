#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to check if the provided wearable Item (Config) item is defined as a modifiable Wardrobe Item.
 * Will not return true on fully inherited "ace_wardrobe" subclass
 *
 * Arguments:
 * 0: Wearable Item <Config>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [_cfg] call ace_wardrobe_fnc_isModifiable
 *
 * Public: No
 */

params [
    ["_cfg", configNull, [configNull]]
];


if (isNull _cfg) exitWith {false};
// Checks if the config has the property without it being inherited(!)
count ( QUOTE(configName _x  isEqualTo QQ(ace_wardrobe)) configClasses _cfg ) > 0
