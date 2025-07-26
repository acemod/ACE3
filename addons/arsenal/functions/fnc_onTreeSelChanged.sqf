#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"
#include "..\defines.hpp"
/*
 * Author: ACE Team
 * Handles selection changes on the left panel tree control.
 * 
 * This function replaces the original fnc_onSelChangedLeft.sqf to work with 
 * RscTree instead of RscListBox. It distinguishes between group folder 
 * selections (which are ignored) and item selections (which proceed with 
 * the normal arsenal logic).
 *
 * Arguments:
 * 0: Tree control <CONTROL>
 * 1: Tree selection path <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_control", "_selectionPath"];

// Only process item selections (length 2 means [groupIndex, itemIndex])
// Group selections (length 1) are ignored as they represent folder nodes
if (count _selectionPath != 2) exitWith {};

private _itemData = _control tvData _selectionPath;

// Safety check - ignore group data which starts with "GROUP_"
if (_itemData find "GROUP_" == 0) exitWith {};

// Create a compatible selection index for the existing selection logic
// We simulate the listbox behavior by finding which "listbox index" this item would have
private _display = ctrlParent _control;

// Get all items in the tree to create a flat index mapping
private _itemCount = 0;
private _selectedItemIndex = -1;
private _groupCount = _control tvCount [];

for "_groupIndex" from 0 to (_groupCount - 1) do {
    // Add empty item for groups (groups aren't selectable items in old system)
    private _itemCountInGroup = _control tvCount [_groupIndex];
    for "_itemIndex" from 0 to (_itemCountInGroup - 1) do {
        private _currentItemData = _control tvData [_groupIndex, _itemIndex];
        if (_currentItemData == _itemData) then {
            _selectedItemIndex = _itemCount;
        };
        _itemCount = _itemCount + 1;
    };
};

// If we couldn't find the item, exit
if (_selectedItemIndex == -1) exitWith {};

// Call the existing selection logic with the simulated listbox selection
// This reuses all the existing weapon/item handling logic
[_control, _selectedItemIndex] call FUNC(onSelChangedLeft);
