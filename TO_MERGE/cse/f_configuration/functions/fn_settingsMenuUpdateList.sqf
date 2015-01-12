/**
 * fn_settingsMenuUpdateList.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_settingsMenu","_ctrlList","_collection","_keyBindingText","_keybinding", "_updateKeyView"];
disableSerialization;

_updateKeyView = [_this, 0, true, [true]] call BIS_fnc_Param;

_settingsMenu = uiNamespace getVariable 'cse_settingsMenu';
_ctrlList = _settingsMenu displayCtrl 200;
_collection = switch (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F) do {
	case "menu": {CSE_F_KEYBINDINGS_MENUS};
	case "action": {CSE_F_KEYBINDINGS_ACTIONS};
	case "option": {CSE_F_CLIENT_SIDE_SETTINGS};
	default {[]};
};

lbclear _ctrlList;
if (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F != "option") then {
	{
		_keybinding = (_x select 1);
		_keyBindingText = keyName (_keybinding select 0);
		if (_keyBindingText == '""') then {
			_keyBindingText = "";
		} else {
			if ((_keybinding select 1) == 1) then {
				_keyBindingText = _keyBindingText + " + shift";
			};
			if ((_keybinding select 2) == 1) then {
				_keyBindingText = _keyBindingText + " + ctrl";
			};
			if ((_keybinding select 3) == 1) then {
				_keyBindingText = _keyBindingText + " + alt";
			};
		};
		_ctrlList lbadd (([_x select 0, CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F] call cse_fnc_getSettingDetails_F) select 0);
		_ctrlList lbadd (_keyBindingText);
	}foreach _collection;
} else {
	{
		_settingsText = ((_x select 1) select (_x select 2));
		_ctrlList lbadd (([_x select 0, CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F] call cse_fnc_getSettingDetails_F) select 0);
		_ctrlList lbadd (_settingsText);
	}foreach _collection;

};
if (_updateKeyView) then {
	[] call cse_fnc_settingsMenuUpdateKeyView;
};