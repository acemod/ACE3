/**
 * fn_gui_createInteractionMenu.sqf
 * @Descr: Creates a interaction menu
 * @Author: Glowbal
 *
 * @Arguments: [name STRINg, keybinding ARRAY, idd NUMBER, condition CODE, type NUMBER]
 * @Return: void
 * @PublicAPI: true
 */

private ["_name","_condition","_keyBinding","_idd","_type","_codeToExecute"];
_name = _this select 0;
_keyBinding = _this select 1;
_idd = _this select 2;
_condition = _this select 3;
_type = _this select 4;

_codeToExecute = compile format[ "%1 call cse_fnc_gui_keyPressed;", [_name,_condition,_type] ];
[_name, _keyBinding, _codeToExecute, _idd] call cse_fnc_addKeyBindingForMenu_F;