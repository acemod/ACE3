/**
 * fn_openRadialSubMenu_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_entries","_menuName", "_target"];
_menuName = [_this, 0, "Main Menu",[""]] call BIS_fnc_Param;
_entries = [_this, 1, [],[[]]] call BIS_fnc_Param;
_target = [_this, 2, ObjNull, [ObjNull]] call BIS_fnc_Param;
[] call cse_fnc_closeRadialSecondRing_GUI;
CSE_RADIAL_SUB_MENU_GUI pushback [_target, _menuName, _entries];
[_target, _entries] call cse_fnc_setRadialMenuOptions_GUI;
[_menuName] call cse_fnc_setRadialMenuName_GUI;
[-1, false] call cse_fnc_setRadialOptionSelected_GUI;
[ ([_target] call cse_fnc_findTargetName_GUI) ] call cse_fnc_setRadialMenuTargetName_GUI;