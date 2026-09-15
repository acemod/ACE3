#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to replace a unit's Facewear, NVG/HMD or Headgear.
 *
 * Arguments:
 * 0: Params Hash <HASHMAP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_replaceData] call ace_wardrobe_fnc_replaceOther
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
