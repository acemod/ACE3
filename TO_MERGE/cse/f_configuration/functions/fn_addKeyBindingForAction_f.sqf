/**
 * fn_addKeyBindingForAction_f.sqf
 * @Descr: Add a new action keybinding
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

_keyCodePressed = _keyBinding select 0;
_shiftPressed = _keyBinding select 1;
_ctrlPressed = _keyBinding select 2;
_altPressed = _keyBinding select 3;

if (isnil "CSE_F_KEYBINDINGS_ACTIONS") then {
	CSE_F_KEYBINDINGS_ACTIONS = [];
};
CSE_F_KEYBINDINGS_ACTIONS pushBack [ _name, _keyBinding, _action ];
[_name, "action"] call cse_fnc_saveKeyBindingToProfile_f;