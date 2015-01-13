/**
 * fn_onListBoxShowSelectionChanged.sqf
 * @Descr: called when the listbox selection has changed. Updates configuration menu information
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

 private ["_first", "_settingsMenu", "_ctrlLb", "_ctrlLbShow"];
_first = (_this select 0);

disableSerialization;
_settingsMenu = uiNamespace getVariable 'cse_settingsMenu';
_ctrlLbShow = _settingsMenu displayCtrl 100;
if (isnil "_first") then {
	_ctrlLbShow lbSetCurSel (_this select 1);
};

if ((_this select 1) > -1) then {
	private ["_options"];
	_options = ["menu","action", "option", "color"];
	CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F = _options select (_this select 1);
	[true] call cse_fnc_settingsMenuUpdateList;
	_textOptions = ["Menu Keybindings", "Action Keybindings", "Client Settings"];
	ctrlSetText [13, ("Current selected settings list: " + (_textOptions select (_this select 1)))];
	if (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F == "color") exitwith {};

	if ((_this select 1) > 1) then {
		(_settingsMenu displayCtrl 400) ctrlShow true;
		lbClear 400;
		(_settingsMenu displayCtrl 401) ctrlShow false;
		(_settingsMenu displayCtrl 402) ctrlShow false;

		(_settingsMenu displayCtrl 301) ctrlSetText "Value:";
		(_settingsMenu displayCtrl 302) ctrlSetText "";
		(_settingsMenu displayCtrl 303) ctrlSetText "";

	} else {
		(_settingsMenu displayCtrl 400) ctrlShow true;
		LbClear 400;
		_ctrlLb = _settingsMenu displayCtrl 400;
		_ctrlLb lbadd "No";
		_ctrlLb lbadd "Yes";
		_ctrlLb lbadd "Ignore";

		(_settingsMenu displayCtrl 401) ctrlShow true;
		(_settingsMenu displayCtrl 402) ctrlShow true;

		(_settingsMenu displayCtrl 301) ctrlSetText "Shift:";
		(_settingsMenu displayCtrl 302) ctrlSetText "Ctrl:";
		(_settingsMenu displayCtrl 303) ctrlSetText "Alt:";
	};
};