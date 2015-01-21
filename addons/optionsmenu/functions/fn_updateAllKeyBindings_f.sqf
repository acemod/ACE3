/**
 * fn_updateAllKeyBindings_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_name","_currentKeyBinding"];
{
	_name = _x select 0;
	_currentKeyBinding = _x select 1;
	_x set [1,([_name, _currentKeyBinding, "menu"] call cse_fnc_getKeyBindingFromProfile_F)];
}foreach CSE_F_KEYBINDINGS_MENUS;

{
	_name = _x select 0;
	_currentKeyBinding = _x select 1;
	_x set [1,([_name, _currentKeyBinding, "action"] call cse_fnc_getKeyBindingFromProfile_F)];
}foreach CSE_F_KEYBINDINGS_ACTIONS;