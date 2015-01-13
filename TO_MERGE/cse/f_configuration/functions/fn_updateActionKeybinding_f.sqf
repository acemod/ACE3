/**
 * fn_updateActionKeybinding_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_name","_keyBinding","_action","_idd","_keyCodePressed","_shiftPressed","_altPressed","_ctrlPressed"];
_name = _this select 0;
_keyBinding = _this select 1;

if (isnil "CSE_F_KEYBINDINGS_ACTIONS") then {
	CSE_F_KEYBINDINGS_ACTIONS = [];
};
{
	if ((_x select 0) == _name) exitwith {
		_x set [ 1, _keyBinding];
	};
}foreach CSE_F_KEYBINDINGS_ACTIONS;

[_name,"action"] call cse_fnc_saveKeyBindingToProfile_F;