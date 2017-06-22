/*
 * Author: Glowbal
 * Blurs screen.
 *
 * Arguments:
 * 0: ID <NUMBER>
 * 1: Show? <BOOL, NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [5, true] call ace_common_fnc_blurScreen
 *
 * Public: Yes
 */
#include "script_component.hpp"

if (!hasInterface) exitWith {};

params ["_id", ["_show", false]];

if (_show isEqualType 0) then {
    _show = _show == 1;
};

if (isNil QGVAR(SHOW_BLUR_SCREEN_COLLECTION)) then {
    GVAR(SHOW_BLUR_SCREEN_COLLECTION) = [];
};

if (_show) then {
    GVAR(SHOW_BLUR_SCREEN_COLLECTION) pushBack _id;

    // show blur
    if (isNil QGVAR(MENU_ppHandle_GUI_BLUR_SCREEN)) then {
        GVAR(MENU_ppHandle_GUI_BLUR_SCREEN) = ppEffectCreate ["DynamicBlur", 102];
        GVAR(MENU_ppHandle_GUI_BLUR_SCREEN) ppEffectAdjust [0.9];
        GVAR(MENU_ppHandle_GUI_BLUR_SCREEN) ppEffectEnable true;
        GVAR(MENU_ppHandle_GUI_BLUR_SCREEN) ppEffectCommit 0;
    };
} else {
    GVAR(SHOW_BLUR_SCREEN_COLLECTION) = GVAR(SHOW_BLUR_SCREEN_COLLECTION) - [_id];

    if (GVAR(SHOW_BLUR_SCREEN_COLLECTION) isEqualTo []) then {
        // hide blur
        if (!isNil QGVAR(MENU_ppHandle_GUI_BLUR_SCREEN)) then {
            ppEffectDestroy GVAR(MENU_ppHandle_GUI_BLUR_SCREEN);
            GVAR(MENU_ppHandle_GUI_BLUR_SCREEN) = nil;
        };
    };
};
