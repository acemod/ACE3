/**
 * fn_addKeyBindingForMenu_f.sqf
 * @Descr: Add a new menu keybinding
 * @Author: Glowbal
 *
 * @Arguments: [name STRING, keybinding ARRAY, action CODE]
 * @Return: void
 * @PublicAPI: true
 */

private ["_name","_keyBinding","_action","_idd","_keyCodePressed","_shiftPressed","_altPressed","_ctrlPressed"];
_name = _this select 0;
_keyBinding = _this select 1;
_action = _this select 2;
_idd = _this select 3;

_keyCodePressed = _keyBinding select 0;
_shiftPressed = _keyBinding select 1;
_ctrlPressed = _keyBinding select 2;
_altPressed = _keyBinding select 3;

if (isnil "CSE_F_KEYBINDINGS_MENUS") then {
	CSE_F_KEYBINDINGS_MENUS = [];
};
CSE_F_KEYBINDINGS_MENUS pushBack [_name, _keyBinding, _action, _idd, [false, false] ];
[_name, "menu"] call cse_fnc_saveKeyBindingToProfile_f;