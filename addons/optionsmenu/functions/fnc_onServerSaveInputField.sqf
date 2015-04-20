/*
 * Author: Glowbal
 * Called when the listbox selection is changed for an options (eg: chaning a setting from false to true)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_onListBoxSettingsChanged
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_settingIndex", "_inputText", "_setting", "_settingName", "_convertedValue"];

_settingIndex =  lbCurSel 200;  //Index of left list
_inputText = ctrlText 414;  //Index of right drop down

switch (GVAR(optionMenu_openTab)) do {
    case (MENU_TAB_SERVER_VALUES): {
        if ((_settingIndex >= 0) && (_settingIndex < (count GVAR(serverSideValues)))) then {
            try {
                _setting = (GVAR(serverSideValues) select _settingIndex);
                _settingName = _setting select 0;

                _convertedValue = switch (toUpper (_setting select 1)) do {
                case "STRING": {format ['"%1"', _inputText]};
                case "ARRAY": {format [call compile "[%1]", _inputText]};
                case "SCALAR": {parseNumber _inputText;};
                    default {throw "Error"};
                };
                [MENU_TAB_SERVER_VALUES, _settingName, _convertedValue] call FUNC(updateSetting);
            } catch {
            };
        };
        [false] call FUNC(serverSettingsMenuUpdateList);
    };
};
