/**
 * fn_closeRadialSecondRing_gui.sqf
 * @Descr: Closes the second ring from the radial menu
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: void
 * @PublicAPI: true
 */

private ["_numberOf","_target","_menuName","_entryToSwitchTo", "_entries"];

[ObjNull, []] call cse_fnc_setRadialSecondRing_GUI;

private ["_numberOf","_entries","_entryToSwitchTo","_target","_menuName"];
if (isnil "CSE_RADIAL_SUB_MENU_GUI") then {
	CSE_RADIAL_SUB_MENU_GUI = [];
};
_numberOf = count CSE_RADIAL_SUB_MENU_GUI - 1;
if (_numberOf < 0) then {
 	_numberOf = 0;
};
if (count CSE_RADIAL_SUB_MENU_GUI == 0) exitwith {};
_entryToSwitchTo = CSE_RADIAL_SUB_MENU_GUI select _numberOf;
_target = _entryToSwitchTo select 0;
_menuName = _entryToSwitchTo select 1;
_entries = _entryToSwitchTo select 2;
[_target, _entries] call cse_fnc_setRadialMenuOptions_GUI;
[_menuName] call cse_fnc_setRadialMenuName_GUI;
[-1, false] call cse_fnc_setRadialOptionSelected_GUI;