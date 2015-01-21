/**
* fnc_settingsMenuUpdateKeyView.sqf
* @Descr: N/A
* @Author: Glowbal
*
* @Arguments: []
* @Return:
* @PublicAPI: false
*/
#include "script_component.hpp"

private ["_setting","_ctrlList","_collection","_settingsMenu", "_keybinding","_keyCode","_shiftPressed","_altPressed","_ctrlPressed"];
disableSerialization;

_settingsMenu = uiNamespace getVariable 'ACE_settingsMenu';
_ctrlList = _settingsMenu displayCtrl 200;

_collection = switch (GVAR(optionMenu_openTab)) do {
case MENU_TAB_OPTIONS: {GVAR(clientSideOptions)};
case MENU_TAB_COLORS: {GVAR(clientSideColors)};
	default {[]};
};

if (count _collection > 0) then {
	_settingIndex =  (lbCurSel _ctrlList);
	if (_settingIndex > (count _collection)) then {
		_settingIndex = count _collection  - 1;
	};

	if (_settingIndex < 0) exitwith {
		_settingIndex = 0;
	};
	_setting = _collection select _settingIndex;

	_entryName = _setting select 0;
	_localizedName = _setting select 1;
	_localizedDescription = _setting select 2;
	
	if (_localizedName == "") then {_localizedName = _entryName;};
	(_settingsMenu displayCtrl 250) ctrlSetText _localizedName;
	(_settingsMenu displayCtrl 251) ctrlSetText _localizedDescription;
	(_settingsMenu displayCtrl 300) ctrlSetText _entryName;

	
	
	switch (GVAR(optionMenu_openTab)) do {
	case (MENU_TAB_OPTIONS): {
			_possibleValues = _setting select 3;
			_settingsValue = _setting select 4;
			lbClear 400;
			{ lbAdd [400, _x]; } foreach _possibleValues;

			(_settingsMenu displayCtrl 400) lbSetCurSel _settingsValue;
		};	
		case (MENU_TAB_COLORS): {
			_currentColor = _setting select 3;
			{
				sliderSetPosition [_x, (255 * (_currentColor select _forEachIndex))];
			} forEach [410, 411, 412, 413];
		};
	};
} else {  //no settings in list:
	lbClear 400;
	(_settingsMenu displayCtrl 250) ctrlSetText _localizedName;
	(_settingsMenu displayCtrl 251) ctrlSetText _localizedDescription;
	(_settingsMenu displayCtrl 300) ctrlSetText _entryName;
};
