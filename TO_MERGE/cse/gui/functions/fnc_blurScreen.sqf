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

private ["_id", "_show"];
_id = [_this, 0, "", [""]] call BIS_fnc_Param;
_show = [_this, 1, false, [false]] call BIS_fnc_Param;

if (isnil QGVAR(SHOW_BLUR_SCREEN_COLLECTION)) then {
	GVAR(SHOW_BLUR_SCREEN_COLLECTION) = [];
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