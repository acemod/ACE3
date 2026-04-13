#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to replace a unit's Facewear, NVG/HMD or .
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Desired variant as classname <STRING>
 * 2: Type of wearable container <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "G_Bandanna_blk", "FACEWEAR"] call ace_wardrobe_fnc_replaceOther
 * [player, "G_Bandanna_aviator", "FACEWEAR"] call ace_wardrobe_fnc_replaceOther
 *
 * Public: No
 */

params ["_replaceData"];

private _player = _replaceData get "player";

// Remove
switch (_replaceData get "typeOrigin") do {
    case TYPE_HEADGEAR: {
        removeHeadgear _player;
    };
    case TYPE_GOGGLE: {
        removeGoggles _player;
    };
    case TYPE_HMD: {
        _player unlinkItem (_replaceData get "classOrigin")
    };
};

// ADD
switch (_replaceData get "typeTarget") do {
    case TYPE_HEADGEAR: {
        _player addHeadgear (_replaceData get "classTarget");
    };
    case TYPE_GOGGLE: {
        _player addGoggles (_replaceData get "classTarget");
    };
    case TYPE_HMD: {
        _player linkItem (_replaceData get "classTarget");
    };
};

GVAR(inProgress) = false; // re-enable action

nil
