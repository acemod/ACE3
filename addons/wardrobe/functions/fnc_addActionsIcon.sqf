#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * This function checks if the target item has an alternative picture for the action, if not, it returns the picture property.
 *
 * Arguments:
 * 0: Config of desired variant <CONFIG>
 *
 * Return Value:
 * Path to icon or "" <STRING>
 *
 * Example:
 * (configFile >> "CfgWeapons" >> "U_B_CTRG_1") call ace_wardrobe_fnc_getActionIcon
 *
 * Public: No
 */

params [["_cfg", configNull, [configNull]]];

if (isNull _cfg) exitWith {};

private _altDispIcon = getText (configFile >> QUOTE(ADDON) >> configName _cfg >> "alternativePicture");

if (_altDispIcon isEqualTo "") then { getText (_cfg >> "picture") } else { _altDispIcon } // return
