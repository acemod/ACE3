/**
 * fn_gui_blurScreen.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

#include "script_component.hpp"

if (!hasInterface) exitWith {};

private ["_show"];
PARAMS_1(_id);
_show = if (count _this > 1) then {_this select 1} else {false};

if (isNil QGVAR(SHOW_BLUR_SCREEN_COLLECTION)) then {
    GVAR(SHOW_BLUR_SCREEN_COLLECTION) = [];
};
if (typeName _show == typeName 0) then {
    _show = (_show == 1);
};

if (_show) then {
    GVAR(SHOW_BLUR_SCREEN_COLLECTION) pushback _id;
    // show blur
    if (isnil QGVAR(MENU_ppHandle_GUI_BLUR_SCREEN)) then {
        GVAR(MENU_ppHandle_GUI_BLUR_SCREEN) = ppEffectCreate ["DynamicBlur", 102];
        GVAR(MENU_ppHandle_GUI_BLUR_SCREEN) ppEffectAdjust [0.9];
        GVAR(MENU_ppHandle_GUI_BLUR_SCREEN) ppEffectEnable true;
        GVAR(MENU_ppHandle_GUI_BLUR_SCREEN) ppEffectCommit 0;
    };
} else {
    GVAR(SHOW_BLUR_SCREEN_COLLECTION) = GVAR(SHOW_BLUR_SCREEN_COLLECTION) - [_id];
    if (GVAR(SHOW_BLUR_SCREEN_COLLECTION) isEqualTo []) then {
        // hide blur
        if (!isnil QGVAR(MENU_ppHandle_GUI_BLUR_SCREEN)) then {
            ppEffectDestroy GVAR(MENU_ppHandle_GUI_BLUR_SCREEN);
            GVAR(MENU_ppHandle_GUI_BLUR_SCREEN) = nil;
        };
    };
};
