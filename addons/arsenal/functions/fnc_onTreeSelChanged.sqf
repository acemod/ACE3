#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: ACE Team
 * Handles selection changes on the left panel tree control.
 *
 * Arguments:
 * 0: Tree control <CONTROL>
 * 1: Tree selection path <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_control, [0, 2]] call ace_arsenal_fnc_onTreeSelChanged
 *
 * Public: No
 */

params ["_control", "_selectionPath"];

// Exit if no selection
if (count _selectionPath == 0) exitWith {};

private _item = _control tvData _selectionPath;

// Ignore group nodes (but not empty entry)
if (_item find "GROUP_" == 0) exitWith {};

// Calculate what the listbox index would be for compatibility with fnc_onSelChangedLeft
private _simulatedIndex = -1;
private _counter = 0;
private _found = false;
private _groupCount = _control tvCount [];

// Handle empty entry (root node with empty data)
if ((count _selectionPath == 1) && {(_control tvData _selectionPath) == ""}) then {
    _simulatedIndex = 0;
    _found = true;
};

// If not the empty entry, iterate through tree to find the simulated index
if (!_found) then {
    // Check if there's an empty entry at the start
    if ((_groupCount > 0) && {(_control tvData [0]) == ""}) then {
        _counter = 1; // Start counting after the empty entry
    };
    
    // Iterate through all groups
    for "_groupIndex" from 0 to (_groupCount - 1) do {
        if (_found) exitWith {};
        
        private _groupData = _control tvData [_groupIndex];
        
        // Skip the empty entry (already handled) and group nodes
        if ((_groupData != "") && {_groupData find "GROUP_" != 0}) then {
            // This is a regular item at root level (shouldn't happen in current implementation, but handle it)
            if (_selectionPath isEqualTo [_groupIndex]) then {
                _simulatedIndex = _counter;
                _found = true;
            };
            _counter = _counter + 1;
        } else {
            // This is a group node - iterate through its items
            if (_groupData find "GROUP_" == 0) then {
                private _itemCount = _control tvCount [_groupIndex];
                for "_itemIndex" from 0 to (_itemCount - 1) do {
                    if (_selectionPath isEqualTo [_groupIndex, _itemIndex]) then {
                        _simulatedIndex = _counter;
                        _found = true;
                        break;
                    };
                    _counter = _counter + 1;
                };
            };
        };
    };
};

// If we found the item, call the original selection handler with the simulated index
if (_simulatedIndex >= 0) then {
    [_control, _simulatedIndex] call FUNC(onSelChangedLeft);
};