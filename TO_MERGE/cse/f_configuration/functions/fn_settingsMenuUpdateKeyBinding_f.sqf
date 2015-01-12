/**
 * fn_settingsMenuUpdateKeyBinding_f.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_settingsMenu","_ctrlSelected","_ctrlPressed","_ctrlTextLabel","_keyCodePressed","_shiftSelected","_shiftPressed","_altSelected","_altPressed","_possibleOptions",'_keyBinding',"_fnc","_collection"];
_settingsMenu = uiNamespace getVariable 'cse_settingsMenu';
 _ctrlTextLabel = (_settingsMenu displayCtrl 300);

_keyCodePressed = _this select 0;
_shiftPressed = _this select 1;
_ctrlPressed = _this select 2;
_altPressed = _this select 3;

 ctrlSetText [252, ''];
//(_settingsMenu displayCtrl 300) ctrlSetText ("Key: " + (keyName _keyCodePressed));

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

_keyBinding = [_keyCodePressed, _possibleOptions select _shiftSelected, _possibleOptions select _ctrlSelected, _possibleOptions select _altSelected];
//CSE_CURRENT_KEYBINDING_SETTING_NAME_F = ["cse_sys_weaponRestAction","action"];

_func = switch (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F) do {
	case "menu": {cse_fnc_updateMenuKeyBinding_F};
	case "action": {cse_fnc_updateActionKeyBinding_F};
	case "option": {{}};
	default {{}};
};
_collection = switch (CSE_SETTINGS_MENU_CURRENT_SETTING_LIST_F) do {
	case "menu": {CSE_F_KEYBINDINGS_MENUS};
	case "action": {CSE_F_KEYBINDINGS_ACTIONS};
	case "option": {CSE_F_CLIENT_SIDE_SETTINGS};
	default {[]};
};
if (count _collection > 0) then {
	_selectedSetting =  (lbCurSel 200);
	if (_selectedSetting > (count _collection)) then {
		_selectedSetting = count _collection  - 1;
	};
	if (_selectedSetting < 0) then {
		_selectedSetting = 0;
	};
	_nameOfSetting = (_collection select _selectedSetting) select 0;
	[_nameOfSetting,_keyBinding] call _func;
	[true] call cse_fnc_settingsMenuUpdateList;
};