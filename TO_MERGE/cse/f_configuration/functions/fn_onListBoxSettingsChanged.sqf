/**
 * fn_onListBoxSettingsChanged.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_settingsMenu", "_ctrlTextLabel", "_optionSelected", "_func", "_collection", "_selectedSetting", "_nameOfSetting"];
_settingsMenu = uiNamespace getVariable 'cse_settingsMenu';

_optionSelected = lbCurSel 400;

if (_optionSelected < 0) then {
	_optionSelected = 0;
};

_func = switch (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F) do {
	case "option": {cse_fnc_updateClientSideOption_F};
	default {{}};
};
_collection = switch (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F) do {
	case "option": {CSE_F_CLIENT_SIDE_SETTINGS};
	default {[]};
};
if !(_collection isEqualTo []) then {
	_selectedSetting =  (lbCurSel (_settingsMenu displayCtrl 200));
	if (_selectedSetting > (count _collection)) then {
		_selectedSetting = count _collection  - 1;
	};
	if (_selectedSetting < 0) then {
		_selectedSetting = 0;
	};
	_nameOfSetting = (_collection select _selectedSetting) select 0;
	[_nameOfSetting, _optionSelected] call _func;
	[_nameOfSetting, _optionSelected] call ((_collection select _selectedSetting) select 3);
	[false] call cse_fnc_settingsMenuUpdateList;
};