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

GVAR(currentCategorySelection) = lbCurSel 14;

systemChat format["Current selection: %1", GVAR(currentCategorySelection)];

[false] call FUNC(serverSettingsMenuUpdateList);
