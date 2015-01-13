/**
 * fn_onSettingsMenuOpen.sqf
 * @Descr: called when the settings or configuration menu has opened. Do not use anywhere else.
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */



_settingsMenu = uiNamespace getVariable 'cse_settingsMenu';
_ctrlLbShow = _settingsMenu displayCtrl 100;
_ctrlLbShow lbadd "Menu Keybindings";
_ctrlLbShow lbadd "Action Keybindings";
_ctrlLbShow lbadd "Client Settings";
_ctrlLbShow lbadd "Colors";
_ctrlLbShow lbSetCurSel 0;


(_settingsMenu displayCtrl 1003) ctrlEnable false;
//lbadd[100,"Other settings"];
CSE_SETTINGS_MENU_EDIT_CURRENT_SETTING_F = false;
_settingsMenu displayAddEventHandler ["KeyDown", {
		_keyCodePressed = _this select 1;
		_shiftPressed = _this select 2;
		_ctrlPressed = _this select 3;
		_altPressed = _this select 4;
		_var = uiNamespace getVariable 'cse_settingsMenu';
		if (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F != "option") then {
			if !(isnil "_var") then {
				if (CSE_SETTINGS_MENU_EDIT_CURRENT_SETTING_F) then {
					if (_keyCodePressed > 1) then {
						[_keyCodePressed,_shiftPressed, _ctrlPressed, _altPressed] call cse_fnc_settingsMenuUpdateKeyBinding_F;
						true;
					} else {
						false;
					};
				} else {
					false;
				};
			} else {
				false;
			};
		} else {
			false;
		};
	}];

_settingsMenu displayAddEventHandler ["KeyUp", {
		_keyCodePressed = _this select 1;
		_shiftPressed = _this select 2;
		_ctrlPressed = _this select 3;
		_altPressed = _this select 4;
		_var = uiNamespace getVariable 'cse_settingsMenu';
		if (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F != "option") then {
			if !(isnil "_var") then {
				if (CSE_SETTINGS_MENU_EDIT_CURRENT_SETTING_F) then {
					if (_keyCodePressed > 1) then {
						CSE_SETTINGS_MENU_EDIT_CURRENT_SETTING_F = false;
						true;
					} else {
						false;
					};
				} else {
					false;
				};
			} else {
				false;
			};
		} else {
			false;
		};
	}];

(_settingsMenu displayCtrl 200) ctrlSetEventHandler ["LBSelChanged", "_this call cse_fnc_settingsMenuUpdateKeyView;"];

_textOptions = ["Menu Keybindings", "Action Keybindings"];
(_settingsMenu displayCtrl 13) ctrlSetText ("Current selected settings list: " + (_textOptions select 0));

_ctrlLb = _settingsMenu displayCtrl 400;
_ctrlLb lbadd "No";
_ctrlLb lbadd "Yes";
_ctrlLb lbadd "Ignore";
_ctrlLb ctrlSetEventHandler ["LBSelChanged", "if (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F != 'option') then { _this call cse_fnc_onListBoxKeyBindingChanged; } else { _this call cse_fnc_onListBoxSettingsChanged; };"];

_ctrlLb = _settingsMenu displayCtrl 401;
_ctrlLb lbadd "No";
_ctrlLb lbadd "Yes";
_ctrlLb lbadd "Ignore";
_ctrlLb ctrlSetEventHandler ["LBSelChanged", " _this call cse_fnc_onListBoxKeyBindingChanged;"];

_ctrlLb = _settingsMenu displayCtrl 402;
_ctrlLb lbadd "No";
_ctrlLb lbadd "Yes";
_ctrlLb lbadd "Ignore";
_ctrlLb ctrlSetEventHandler ["LBSelChanged", " _this call cse_fnc_onListBoxKeyBindingChanged;"];

CSE_SETTINGS_MENU_EDIT_CURRENT_SETTING_F = false;
CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F = "menu";
[true] call cse_fnc_settingsMenuUpdateList;

(_settingsMenu displayCtrl 200) lbSetCurSel 0;