/**
 * fn_setRadialMenuName_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_menuName", "_buttonName", "_display", "_countOf"];
_menuName = [_this, 0, "Main Menu",[""]] call BIS_fnc_Param;
ctrlSetText [1, _menuName];

if (count CSE_RADIAL_SUB_MENU_GUI > 1) then {
	_countOf = (count CSE_RADIAL_SUB_MENU_GUI) - 2;
	_buttonName = "Return to " + ((CSE_RADIAL_SUB_MENU_GUI select _countOf) select 1);
} else {
	_buttonName = "Close Menu";
};

disableSerialization;
_display = uiNamespace getvariable "CSE_RADIAL_MENU";
(_display displayCtrl 2315) ctrlSetTooltip _buttonName;