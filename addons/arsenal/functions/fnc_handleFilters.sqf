#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: AmsteadRayle
 * Handles selection of filters
 *
 * Arguments:
 * 0: Filter listbox control <CONTROL>
 * 1: Index of newest selected item <SCALAR>
 * 2: Array of selected indices <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_control", "_newIndex", "_selectedIndices"];
TRACE_3("Handling filters", _control, _newIndex, _selectedIndices);

if (lbSize _control == 0) exitWith {}; // Skip if no available filters

private _display = ctrlParent _control;

// Default to unchecked icon
for "_i" from 0 to (lbSize _control) -1 do {
    _control lbSetPicture [_i, "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa"];
};
// Switch selected to checked icon
{
    _control lbSetPicture [_x, "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa"];
} forEach _selectedIndices;

[_display, _display displayCtrl GVAR(currentLeftPanel)] call FUNC(fillLeftPanel);

private _leftPanelCtrl = _display displayCtrl IDC_leftTabContent;
private _leftItemCount = lbSize _leftPanelCtrl;
TRACE_1("# of items:", _leftItemCount);

private _passedFilter = [];
_passedFilter resize [_leftItemCount, false];

{
    if !(_forEachIndex in _selectedIndices) then {continue};
    private _statement = _x select 2;
    TRACE_1("Statement:", _statement);
    {
        _passedFilter set [_forEachIndex, _x || (((_leftPanelCtrl lbData _forEachIndex) call CBA_fnc_getItemConfig) call _statement)];
    } forEach _passedFilter;
} forEach GVAR(filters);

TRACE_1("# passed filter:", {_x} count _passedFilter);

{
    if (_x) then {continue};
    _leftPanelCtrl lbDelete _forEachIndex;
} forEachReversed _passedFilter;

[_display, _display displayCtrl IDC_rightSearchbar] call FUNC(handleSearchBar);
