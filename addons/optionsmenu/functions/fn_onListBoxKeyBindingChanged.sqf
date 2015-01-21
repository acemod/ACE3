/**
 * fn_onListBoxKeyBindingChanged.sqf
 * @Descr: called when the listbox keybinding has changed. Updates the configuration menu with new information.
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_settingsMenu","_ctrlSelected","_ctrlPressed","_ctrlTextLabel","_keyCodePressed","_shiftSelected","_shiftPressed","_altSelected","_altPressed","_possibleOptions",'_keyBinding',"_fnc","_collection"];
_settingsMenu = uiNamespace getVariable 'cse_settingsMenu';

_shiftSelected = lbCurSel 400;
_ctrlSelected = lbCurSel 401;
_altSelected = lbCurSel 402;

_possibleOptions = [0,1,2];

if (_shiftSelected < 0) then {
	_shiftSelected = 0;
};
if (_ctrlSelected < 0) then {
	_ctrlSelected = 0;
};
if (_altSelected < 0) then {
	_altSelected = 0;
};

_func = switch (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F) do {
	case "menu": {cse_fnc_updateMenuKeyBinding_F};
	case "action": {cse_fnc_updateActionKeyBinding_F};
	default {{}};
};
_collection = switch (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F) do {
	case "menu": {CSE_F_KEYBINDINGS_MENUS};
	case "action": {CSE_F_KEYBINDINGS_ACTIONS};
	default {[]};
};
if (count _collection > 0) then {
	_selectedSetting =  (lbCurSel (_settingsMenu displayCtrl 200));
	if (_selectedSetting > (count _collection)) then {
		_selectedSetting = count _collection  - 1;
	};
	if (_selectedSetting < 0) then {
		_selectedSetting = 0;
	};
	_nameOfSetting = (_collection select _selectedSetting) select 0;
	 _keyBinding = [_nameOfSetting,CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F,[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F;
	_keyBinding = [_keyBinding select 0, _possibleOptions select _shiftSelected, _possibleOptions select _ctrlSelected, _possibleOptions select _altSelected];
	[_nameOfSetting,_keyBinding] call _func;

	[false] call cse_fnc_settingsMenuUpdateList;
};