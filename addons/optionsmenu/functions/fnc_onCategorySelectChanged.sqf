/*
 * Author: Glowbal
 * Changes which category is selected
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_onCategorySelectChanged
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_settingsMenu", "_ctrlComboBox"];

disableSerialization;
_settingsMenu = uiNamespace getVariable 'ACE_settingsMenu';

_ctrlComboBox = (_settingsMenu displayCtrl 14);
GVAR(currentCategorySelection) = lbCurSel _ctrlComboBox;

[true] call FUNC(settingsMenuUpdateList);
