#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: ACE Team
 * Handles grouping checkbox toggle event.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Checkbox state <NUMBER> (0 = unchecked, 1 = checked)
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_display", "_checked"];

// Convert number to boolean (checkbox returns 0/1, we need true/false)
private _isEnabled = _checked > 0;

GVAR(groupingEnabled) = _isEnabled;
profileNamespace setVariable [QGVAR(groupingEnabled), _isEnabled];

private _groupingDropdownCtrl = _display displayCtrl IDC_groupingMethodDropdown;
_groupingDropdownCtrl ctrlEnable _isEnabled;

// Refresh the current left panel to apply grouping changes
private _currentLeftPanelCtrl = _display displayCtrl GVAR(currentLeftPanel);
if (!isNull _currentLeftPanelCtrl) then {
    [_display, _currentLeftPanelCtrl] call FUNC(fillLeftPanel);
};
