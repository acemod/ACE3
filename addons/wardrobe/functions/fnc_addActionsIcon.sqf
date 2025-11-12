#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Selects the picture for the action from the alternativePicture property or the item itself.
 *
 * Arguments:
 * 0: Config of desired variant <CONFIG>
 *
 * Return Value:
 * Path to icon or "" <STRING>
 *
 * Example:
 * (configFile >> "CfgWeapons" >> "U_B_CTRG_1") call ace_wardrobe_fnc_addActionsIcon
 *
 * Public: No
 */

params ["_cfg"];

private _altDispIcon = getText (configFile >> QUOTE(ADDON) >> configName _cfg >> "alternativePicture");
if (_altDispIcon isEqualTo "") then {
    getText (_cfg >> "picture")
} else {
    _altDispIcon
}
