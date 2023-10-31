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

// Make the listbox behave like a set of checkboxes
// Override user selections but not program-driven selections
if !(GVAR(programSetFilters)) then {
    private _newSelection = GVAR(lastSelectedFilters);
    if (_newIndex in GVAR(lastSelectedFilters)) then {
        _newSelection = _newSelection - [_newIndex]; // Uncheck
    } else {
        _newSelection = _newSelection + [_newIndex]; // Check
    };

    _control lbSetSelected [_newSelection, true];
    GVAR(lastSelectedFilters) = _newSelection;
} else {
    GVAR(lastSelectedFilters) = _selectedIndices;
};
_selectedIndices = GVAR(lastSelectedFilters);

private _display = ctrlParent _control;

// Set filter button icons (checkboxes)
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

// Compute filters
private _passedFilter = [];
_passedFilter resize [_leftItemCount, false]; // Array of falses

{
    if !(_forEachIndex in _selectedIndices) then {continue};
    private _statement = _x select 2;
    TRACE_1("Statement:", _statement);
    {
        // If entry already passed a filter, `||` short circuits any further filter checks
        _passedFilter set [
            _forEachIndex,
            _x || {((_leftPanelCtrl lbData _forEachIndex) call CBA_fnc_getItemConfig) call _statement}
        ];
    } forEach _passedFilter;
} forEach GVAR(filters);

TRACE_1("# passed filter:", {_x} count _passedFilter);

// Apply filters
{
    if (_x) then {continue};
    _leftPanelCtrl lbDelete _forEachIndex;
} forEachReversed _passedFilter;

// Reapply search to filtered list
[_display, _display displayCtrl IDC_rightSearchbar] call FUNC(handleSearchBar);

// Check or uncheck the box for toggling all filters
private _filtersCheckBox = _display displayCtrl IDC_filtersAllCheckBox;
_filtersCheckbox cbSetChecked (lbSize _control == count _selectedIndices);
