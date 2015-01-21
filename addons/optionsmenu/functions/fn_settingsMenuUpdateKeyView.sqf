/**
 * fn_settingsMenuUpdateKeyView.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_setting","_ctrlList","_collection","_settingsMenu", "_keybinding","_keyCode","_shiftPressed","_altPressed","_ctrlPressed"];
disableSerialization;
_settingsMenu = uiNamespace getVariable 'cse_settingsMenu';
_ctrlList = _settingsMenu displayCtrl 200;
_collection = switch (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F) do {
	case "menu": {CSE_F_KEYBINDINGS_MENUS};
	case "action": {CSE_F_KEYBINDINGS_ACTIONS};
	case "option": {CSE_F_CLIENT_SIDE_SETTINGS};
	default {[]};
};


if (count _collection > 0) then {
	_selectedSetting =  (lbCurSel _ctrlList);
	if (_selectedSetting > (count _collection)) then {
		_selectedSetting = count _collection  - 1;
	};

	if (_selectedSetting < 0) exitwith {
		_selectedSetting = 0;
	};
	_setting = _collection select _selectedSetting;

	_details = [_setting select 0, CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F] call cse_fnc_getSettingDetails_F;
	(_settingsMenu displayCtrl 250) ctrlSetText (_details select 0);
	(_settingsMenu displayCtrl 251) ctrlSetText (_details select 1);

	if (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F != "option") then {
		_keybinding = _setting select 1;

		_keyCode = _keybinding select 0;
		_shiftPressed = _keybinding select 1;
		_ctrlPressed = _keybinding select 2;
		_altPressed = _keybinding select 3;

		_keyBindingText = keyName _keyCode;
		if (_keyBindingText == '""') then {
			_keyBindingText = "No key assigned";
		};
		(_settingsMenu displayCtrl 300) ctrlSetText ("Key: " + _keyBindingText);

		lbClear 400;
		lbadd [400, "No"];
		lbadd [400, "Yes"];
		lbadd [400, "Ignore"];
		(_settingsMenu displayCtrl 400) lbSetCurSel _shiftPressed;
		(_settingsMenu displayCtrl 401) lbSetCurSel _ctrlPressed;
		(_settingsMenu displayCtrl 402) lbSetCurSel _altPressed;
	} else {
		_possibleValues = _setting select 1;
		_settingsValue = _setting select 2;

		lbClear 400;

		_settingsText = (_possibleValues select _settingsValue); // expecting: value [[any, TEXT (DESCRIPTION)]]
		(_settingsMenu displayCtrl 300) ctrlSetText ("Setting: " + _settingsText);
		{
			lbAdd [400, _x];
		}foreach _possibleValues;

		(_settingsMenu displayCtrl 400) lbSetCurSel _settingsValue;
	};
};