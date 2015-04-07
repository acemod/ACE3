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

private ["_settingIndex", "_rightDropDownIndex"];

_settingIndex =  lbCurSel 200;  //Index of left list
_rightDropDownIndex = lbCurSel 400;  //Index of right drop down

if (_rightDropDownIndex < 0) then {_rightDropDownIndex = 0;};

switch (GVAR(optionMenu_openTab)) do {
    case (MENU_TAB_OPTIONS): {
        if ((_settingIndex >= 0) && (_settingIndex < (count GVAR(clientSideOptions)))) then {
          _settingIndex = (GVAR(clientSideOptions) select _settingIndex) select 0;
          [MENU_TAB_OPTIONS, _settingIndex, _rightDropDownIndex] call FUNC(updateSetting);
        };
        [false] call FUNC(settingsMenuUpdateList);
      };
    case (MENU_TAB_SERVER_OPTIONS): {
        if ((_settingIndex >= 0) && (_settingIndex < (count GVAR(serverSideOptions)))) then {
          _settingIndex = (GVAR(serverSideOptions) select _settingIndex) select 0;
          [MENU_TAB_SERVER_OPTIONS, _settingIndex, _rightDropDownIndex] call FUNC(updateSetting);
        };
        [false] call FUNC(serverSettingsMenuUpdateList);
      };
};
