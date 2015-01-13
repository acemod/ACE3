/**
 * fn_gui_blurScreen.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

private ["_id", "_show"];
_id = [_this, 0, "", [""]] call BIS_fnc_Param;
_show = [_this, 1, false, [false]] call BIS_fnc_Param;

if (isnil "CSE_GUI_SHOW_BLUR_SCREEN_COLLECTION") then {
	CSE_GUI_SHOW_BLUR_SCREEN_COLLECTION = [];
};

if (_show) then {
	CSE_GUI_SHOW_BLUR_SCREEN_COLLECTION pushback _id;
	// show blur
	if (isnil 'CSE_MENU_ppHandle_GUI_BLUR_SCREEN') then {
		CSE_MENU_ppHandle_GUI_BLUR_SCREEN = ppEffectCreate ["DynamicBlur", 102];
		CSE_MENU_ppHandle_GUI_BLUR_SCREEN ppEffectAdjust [0.9];
		CSE_MENU_ppHandle_GUI_BLUR_SCREEN ppEffectEnable true;
		CSE_MENU_ppHandle_GUI_BLUR_SCREEN ppEffectCommit 0;
	};
} else {
	CSE_GUI_SHOW_BLUR_SCREEN_COLLECTION = CSE_GUI_SHOW_BLUR_SCREEN_COLLECTION - [_id];
	if (CSE_GUI_SHOW_BLUR_SCREEN_COLLECTION isEqualTo []) then {
		// hide blur
		if (!isnil 'CSE_MENU_ppHandle_GUI_BLUR_SCREEN') then {
			ppEffectDestroy CSE_MENU_ppHandle_GUI_BLUR_SCREEN;
			CSE_MENU_ppHandle_GUI_BLUR_SCREEN = nil;
		};
	};
};