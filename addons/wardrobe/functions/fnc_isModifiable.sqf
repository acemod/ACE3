#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to check if the provided wearable Item (Config) can be modified through ace_wardrobe.
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

/* old 
// Checks if the config has the property without it being inherited(!)
count ( QUOTE(configName _x  isEqualTo QUOTE(QUOTE(ace_wardrobe))) configClasses _cfg ) > 0
*/

isClass (configFile >> QUOTE(ADDON) >> configName _cfg)