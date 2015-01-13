/**
 * fn_returnToPreviousSubMenu_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_numberOf","_entries","_entryToSwitchTo","_target","_menuName"];
if (isnil "CSE_RADIAL_SUB_MENU_GUI") then {
	CSE_RADIAL_SUB_MENU_GUI = [];
};
_numberOf = count CSE_RADIAL_SUB_MENU_GUI - 1;
if (_numberOf < 0) then {
 	_numberOf = 0;
};
if (count CSE_RADIAL_SUB_MENU_GUI == 0 || ((_numberOf - 1) < 0)) exitwith {
	closedialog 432341;
};
_entryToSwitchTo = CSE_RADIAL_SUB_MENU_GUI select (_numberOf - 1);
CSE_RADIAL_SUB_MENU_GUI resize _numberOf;
_target = _entryToSwitchTo select 0;
_menuName = _entryToSwitchTo select 1;
_entries = _entryToSwitchTo select 2;

[_target, _entries] call cse_fnc_setRadialMenuOptions_GUI;
[_menuName] call cse_fnc_setRadialMenuName_GUI;