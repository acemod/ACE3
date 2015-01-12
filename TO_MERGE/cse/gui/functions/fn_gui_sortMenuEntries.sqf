/**
 * fn_gui_sortMenuEntries.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_menuName"];
_menuName = _this select 0;

_MENU_VAR = format["CSE_GUI_MENU_OPTIONS_%1", _menuName];
if (isnil _MENU_VAR) then {
	call compile format["%1 = [];",_MENU_VAR];
};

if (count (call compile _MENU_VAR) > 1) then {
	format["%1 = [%1,[],{_x}] call BIS_fnc_sortBy;",_MENU_VAR];
};
true