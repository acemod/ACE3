#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Getter Function for the displayName of a change - checks for directional property, if not, get from target.
 * Also checks for alternativeActionName
 *
 * Arguments:
 * 0: Current variant <CONFIG>
 * 1: Desired variant <CONFIG>
 *
 * Return Value:
 * Display name of the action <STRING>
 *
 * Example:
 * [(configFile >> "CfgWeapons" >> "U_B_CTRG_3"), (configFile >> "CfgWeapons" >> "U_B_CTRG_1")] call ace_wardrobe_fnc_getDisplayName
 *
 * Public: No
 */

params ["_cfgOrigin", "_cfgTarget"];

private _classOrigin = configName _cfgOrigin;
private _classTarget = configName _cfgTarget;

switch (true) do {
   
    // check legacy directional
    case (
        isText  (configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "directionalActionName")
    ): {
        getText (configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "directionalActionName")
    };

    // check directional
    case (
        isText  (configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "displayName")
    ): {
        getText (configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "displayName")
    };

    // check legacy wardrobeCfg of target
    case (
        isText  (configFile >> QUOTE(ADDON) >> _classTarget >> "alternativeActionName")
    ): {
        getText (configFile >> QUOTE(ADDON) >> _classTarget >> "alternativeActionName")
    };

    // check wardrobeCfg of target
    case (
        // since displayName is defined in the base, it's always present, so we need to check if its not an empty string
        isText  (configFile >> QUOTE(ADDON) >> _classTarget >> "displayName") && { getText (configFile >> QUOTE(ADDON) >> _classTarget >> "displayName") isNotEqualTo "" }
    ): {
        getText (configFile >> QUOTE(ADDON) >> _classTarget >> "displayName")
    };

    // Fallback displayName of Item
    default {
        getText (_cfgTarget  >> "displayName")
    };
};
