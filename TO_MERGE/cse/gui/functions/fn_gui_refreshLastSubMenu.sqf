/**
 * fn_gui_refreshLastSubMenu.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_lastMenu"];
_lastMenu = CMS_GUI_LATEST_SUBMENU;

if ((_lastMenu select 1) > 200 && (_lastMenu select 1) < 300) then {
	call cse_fnc_gui_hideSubSubMenuButtons;
} else {
	call cse_fnc_gui_hideSubMenuButtons;
};
_lastMenu call cse_fnc_gui_displaySubMenuButtons;
