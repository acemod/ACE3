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

disableSerialization;
private _settingsMenu = uiNamespace getVariable 'ACE_settingsMenu';

private _ctrlComboBox = (_settingsMenu displayCtrl 14);
GVAR(currentCategorySelection) = _ctrlComboBox lbValue (lbCurSel _ctrlComboBox);

[true] call FUNC(settingsMenuUpdateList);
