#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to check if the provided wearable item (Config) can be modified through ace_wardrobe.
 *
 * Arguments:
 * 0: Wearable item <CONFIG>
 *
 * Return Value:
 * Result <BOOL>
 *
 * Example:
 * _cfg call ace_wardrobe_fnc_isModifiable
 *
 * Public: No
 */

params [ ["_cfg", configNull, [configNull]] ];


!isNull _cfg && { isClass (configFile >> QUOTE(ADDON) >> configName _cfg) }
