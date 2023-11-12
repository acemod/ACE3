#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Clear the provided searchbar.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Searchbar control <CONTROL>
 * 2: Mouse button <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", "_buttonPressed"];

if (_buttonPressed != 1) exitWith  {};

_control ctrlSetText "";

if (ctrlIDC _control == IDC_leftSearchbar) then {
    [_display, _display displayCtrl GVAR(currentLeftPanel)] call FUNC(fillLeftPanel);
} else {
    [_display, _display displayCtrl GVAR(currentRightPanel)] call FUNC(fillRightPanel);
};
