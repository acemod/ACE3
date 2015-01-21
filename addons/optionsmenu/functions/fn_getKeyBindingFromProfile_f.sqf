/**
 * fn_getKeyBindingFromProfile_f.sqf
 * @Descr: Grab a keybinding settings saved in the profile.
 * @Author: Glowbal
 *
 * @Arguments: [name STRING, type STRING (Can be: Action or Menu), defaultValue ARRAY (Format: [keyCode, shift, ctrl], alt)]
 * @Return: ARRAY  Format: [keyCode, shift, ctrl, alt]
 * @PublicAPI: true
 */

private ["_name","_default","_keyBinding"];
_name = _this select 0;
_type = _this select 1;
_default = _this select 2;

_keyBinding = profileNamespace getvariable ["cse_f_keybinding_"+_type+"_"+_name, _default];

_keyBinding