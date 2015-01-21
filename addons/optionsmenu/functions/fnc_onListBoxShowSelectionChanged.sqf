/**
* fnc_onListBoxShowSelectionChanged.sqf
* @Descr: called when the listbox selection has changed. Updates configuration menu information
* @Author: Glowbal
*
* @Arguments: []
* @Return:
* @PublicAPI: false
*/
#include "script_component.hpp"

private ["_settingsMenu"];

PARAMS_1(_openTab);
GVAR(optionMenu_openTab) = _openTab;

// _textOptions = ["Menu Keybindings", "Action Keybindings", "Client Settings"];

disableSerialization;
_settingsMenu = uiNamespace getVariable 'ACE_settingsMenu';

[true] call FUNC(settingsMenuUpdateList);

switch (GVAR(optionMenu_openTab)) do {
case (MENU_TAB_OPTIONS): {
    _localizedHeader = format ["%1: %2", ("Settings"), ("Client Options")];
    ctrlSetText [13, _localizedHeader];

    lbClear 400;

    (_settingsMenu displayCtrl 301) ctrlShow true;
    (_settingsMenu displayCtrl 310) ctrlShow false;
    (_settingsMenu displayCtrl 311) ctrlShow false;
    (_settingsMenu displayCtrl 312) ctrlShow false;
    (_settingsMenu displayCtrl 313) ctrlShow false;

    (_settingsMenu displayCtrl 400) ctrlShow true;
    (_settingsMenu displayCtrl 410) ctrlShow false;
    (_settingsMenu displayCtrl 411) ctrlShow false;
    (_settingsMenu displayCtrl 412) ctrlShow false;
    (_settingsMenu displayCtrl 413) ctrlShow false;
  };
case (MENU_TAB_COLORS): {
    _localizedHeader = format ["%1: %2", ("Settings"), ("Colors")];
    ctrlSetText [13, _localizedHeader];

    lbClear 400;

    (_settingsMenu displayCtrl 301) ctrlShow false;
    (_settingsMenu displayCtrl 310) ctrlShow true;
    (_settingsMenu displayCtrl 311) ctrlShow true;
    (_settingsMenu displayCtrl 312) ctrlShow true;
    (_settingsMenu displayCtrl 313) ctrlShow true;

    (_settingsMenu displayCtrl 400) ctrlShow false;
    (_settingsMenu displayCtrl 410) ctrlShow true;
    (_settingsMenu displayCtrl 411) ctrlShow true;
    (_settingsMenu displayCtrl 412) ctrlShow true;
    (_settingsMenu displayCtrl 413) ctrlShow true;

    (_settingsMenu displayCtrl 410) sliderSetRange [0, 1];
    (_settingsMenu displayCtrl 411) sliderSetRange [0, 1];
    (_settingsMenu displayCtrl 412) sliderSetRange [0, 1];
    (_settingsMenu displayCtrl 413) sliderSetRange [0, 1];
  };
};
