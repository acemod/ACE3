#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: AmsteadRayle
 * Handles selection of filters
 *
 * Arguments:
 * 0: Checkbox control <CONTROL>
 * 1: Checked state (Unused) <SCALAR>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_control", ""]; // The state passed by the event is an integer, not a bool

private _display = ctrlParent _control;
private _filterCtrl = _display displayCtrl IDC_filtersListBox;
GVAR(programSetFilters) = true;
_filterCtrl lbSetSelected [-1, cbChecked _control, false];
_filterCtrl lbSetCurSel -1; // Remove frame from "selected" item
GVAR(programSetFilters) = false;
