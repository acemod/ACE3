#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: ACE Team
 * Handles grouping method dropdown change event.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Selected index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_display", "_selectedIndex"];

GVAR(groupingMethod) = _selectedIndex;
profileNamespace setVariable [QGVAR(groupingMethod), _selectedIndex];

// Only refresh if grouping is enabled
if (GVAR(groupingEnabled) isEqualTo true) then {
    private _currentLeftPanelCtrl = _display displayCtrl GVAR(currentLeftPanel);
    if (!isNull _currentLeftPanelCtrl) then {
        [_display, _currentLeftPanelCtrl] call FUNC(fillLeftPanel);
    };
};
