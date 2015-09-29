/*
 * Author: Glowbal
 * Changes which tab is open (options or colors)
 *
 * Arguments:
 * The tab to open (defined in script_component) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [MENU_TAB_COLORS] call ACE_optionsmenu_fnc_onListBoxShowSelectionChanged
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_settingsMenu", "_localizedHeader"];

PARAMS_1(_openTab);
GVAR(optionMenu_openTab) = _openTab;

disableSerialization;
_settingsMenu = uiNamespace getVariable 'ACE_serverSettingsMenu';

switch (GVAR(optionMenu_openTab)) do {
case (MENU_TAB_SERVER_OPTIONS): {
    _localizedHeader = format ["%1: %2", (localize LSTRING(OpenConfigMenu)), (localize LSTRING(TabOptions))];
    ctrlSetText [13, _localizedHeader];
    lbClear 400;

    (_settingsMenu displayCtrl 301) ctrlShow true;

    (_settingsMenu displayCtrl 400) ctrlShow true;
    (_settingsMenu displayCtrl 410) ctrlShow false;
    (_settingsMenu displayCtrl 411) ctrlShow false;
    (_settingsMenu displayCtrl 412) ctrlShow false;
    (_settingsMenu displayCtrl 413) ctrlShow false;
    (_settingsMenu displayCtrl 414) ctrlShow false;
    (_settingsMenu displayCtrl 415) ctrlShow false;
    (_settingsMenu displayCtrl 416) ctrlShow false;
    (_settingsMenu displayCtrl 416) ctrlEnable false;
  };
case (MENU_TAB_SERVER_COLORS): {
    _localizedHeader = format ["%1: %2", (localize LSTRING(OpenConfigMenu)), (localize LSTRING(TabColors))];
    ctrlSetText [13, _localizedHeader];

    lbClear 400;

    (_settingsMenu displayCtrl 301) ctrlShow false;

    (_settingsMenu displayCtrl 400) ctrlShow false;
    (_settingsMenu displayCtrl 410) ctrlShow true;
    (_settingsMenu displayCtrl 411) ctrlShow true;
    (_settingsMenu displayCtrl 412) ctrlShow true;
    (_settingsMenu displayCtrl 413) ctrlShow true;

    (_settingsMenu displayCtrl 410) sliderSetRange [0, 255];
    (_settingsMenu displayCtrl 411) sliderSetRange [0, 255];
    (_settingsMenu displayCtrl 412) sliderSetRange [0, 255];
    (_settingsMenu displayCtrl 413) sliderSetRange [0, 255];

    (_settingsMenu displayCtrl 414) ctrlShow false;
    (_settingsMenu displayCtrl 415) ctrlShow false;
    (_settingsMenu displayCtrl 416) ctrlShow false;
    (_settingsMenu displayCtrl 416) ctrlEnable false;
  };
case (MENU_TAB_SERVER_VALUES): {
    _localizedHeader = format ["%1: %2", (localize LSTRING(OpenConfigMenu)), (localize LSTRING(TabValues))];
    ctrlSetText [13, _localizedHeader];

    lbClear 400;
    (_settingsMenu displayCtrl 301) ctrlShow false;
    (_settingsMenu displayCtrl 400) ctrlShow false;
    (_settingsMenu displayCtrl 410) ctrlShow false;
    (_settingsMenu displayCtrl 411) ctrlShow false;
    (_settingsMenu displayCtrl 412) ctrlShow false;
    (_settingsMenu displayCtrl 413) ctrlShow false;

    (_settingsMenu displayCtrl 414) ctrlShow true;
    (_settingsMenu displayCtrl 415) ctrlShow true;
    (_settingsMenu displayCtrl 416) ctrlShow true;
    (_settingsMenu displayCtrl 416) ctrlEnable true;
  };
};

[true] call FUNC(serverSettingsMenuUpdateList);
