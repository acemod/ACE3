#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Getter Function for the Icon of a change - checks for directional property, cfgWardrobe property or falls back to target inventory Image.
 * Also checks for legacy property name.
 *
 * Arguments:
 * 0: Current variant <CONFIG>
 * 1: Desired variant <CONFIG>
 *
 * Return Value:
 * Icon path of the action <STRING>
 *
 * Example:
 * [(configFile >> "CfgWeapons" >> "U_B_CTRG_3"), (configFile >> "CfgWeapons" >> "U_B_CTRG_1")] call ace_wardrobe_fnc_getIcon
 *
 * Public: No
 */

params ["_cfgOrigin", "_cfgTarget"];

private _classOrigin = configName _cfgOrigin;
private _classTarget = configName _cfgTarget;

switch (true) do {
   
    // check directional
    case (
        isText  (configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "icon")
    ): {
        getText (configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "icon")
    };

    // check legacy wardrobeCfg of target
    case (
        isText  (configFile >> QUOTE(ADDON) >> _classTarget >> "alternativePicture")
    ): {
        getText (configFile >> QUOTE(ADDON) >> _classTarget >> "alternativePicture")
    };

    // check wardrobeCfg of target
    case (
        isText  (configFile >> QUOTE(ADDON) >> _classTarget >> "icon") && { getText (configFile >> QUOTE(ADDON) >> _classTarget >> "icon") isNotEqualTo "" }
    ): {
        getText (configFile >> QUOTE(ADDON) >> _classTarget >> "icon")
    };

    // Fallback to target item picture
    default { getText (_cfgTarget >> "picture") };

} // return
