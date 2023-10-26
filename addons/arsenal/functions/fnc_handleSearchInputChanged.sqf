#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: PabstMirror
 * Handles user input in the search text boxes
 *
 * Arguments:
 * 0: Search text input (left or right) <CONTROL>
 * 1: Text <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_ctrl", "_newText"];

if (!GVAR(liveUpdateSearch)) exitWith {};

private _display = ctrlParent _ctrl;

if (GVAR(leftSearchbarFocus)) then {
    [_display, _display displayCtrl IDC_leftSearchbar, false] call FUNC(handleSearchBar);
};
if (GVAR(rightSearchbarFocus)) then {
    [_display, _display displayCtrl IDC_rightSearchbar, false] call FUNC(handleSearchBar);
};
