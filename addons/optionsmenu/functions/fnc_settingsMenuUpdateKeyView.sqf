/*
 * Author: Glowbal
 * Updates the right half of the option menu for the currently selected option.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_settingsMenuUpdateKeyView
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_settingsMenu", "_ctrlList", "_collection", "_settingIndex", "_setting", "_entryName", "_localizedName", "_localizedDescription", "_possibleValues", "_settingsValue", "_currentColor"];
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

    if (_settingIndex < 0) then {
        _settingIndex = 0;
    };
    _setting = _collection select _settingIndex;

    _entryName = _setting select 0;
    _localizedName = _setting select 3;
    _localizedDescription = _setting select 4;

    if (_localizedName == "") then {_localizedName = _entryName;};
    (_settingsMenu displayCtrl 250) ctrlSetText _localizedName;
    (_settingsMenu displayCtrl 251) ctrlSetText _localizedDescription;
    (_settingsMenu displayCtrl 300) ctrlSetText _entryName;

    switch (GVAR(optionMenu_openTab)) do {
        case (MENU_TAB_OPTIONS): {
            _possibleValues = _setting select 5;
            _settingsValue = _setting select 8;

            // Created disable/enable options for bools
            if ((_setting select 1) == "BOOL") then {
                lbClear 400;
                lbAdd [400, (localize ELSTRING(common,No))];
                lbAdd [400, (localize ELSTRING(common,Yes))];
                _settingsValue = [0, 1] select _settingsValue;
            } else {
                lbClear 400;
                { lbAdd [400, _x]; } foreach _possibleValues;
            };
            (_settingsMenu displayCtrl 400) lbSetCurSel _settingsValue;
        };
        case (MENU_TAB_COLORS): {
            _currentColor = _setting select 8;
            {
                sliderSetPosition [_x, (255 * (_currentColor select _forEachIndex))];
            } forEach [410, 411, 412, 413];
        };
    };
} else {  //no settings in list:
    lbClear 400;
    (_settingsMenu displayCtrl 250) ctrlSetText "No settings available";
    (_settingsMenu displayCtrl 251) ctrlSetText "No settings available";
    (_settingsMenu displayCtrl 300) ctrlSetText "No settings available";
};
