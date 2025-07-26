#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Handles keyboard inputs inside the searchbars text boxes.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Searchbar control <CONTROL>
 * 2: Animate panel refresh <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", ["_animate", true]];

forceUnicode 0; // handle non-ANSI characters

private _searchString = ctrlText _control;
private _searchPattern = "";
if (_searchString != "") then {
    _searchPattern = _searchString call EFUNC(common,escapeRegex);
    _searchPattern = ".*?" + (_searchPattern splitString " " joinString ".*?") + ".*?/io";
};

// Right panel search bar
if ((ctrlIDC _control) == IDC_rightSearchbar) then {
    // Don't refill if there is no need
    if (GVAR(lastSearchTextRight) != "" && {(_searchString find GVAR(lastSearchTextRight)) != 0}) then {
        [_display, _display displayCtrl GVAR(currentRightPanel), _animate] call FUNC(fillRightPanel);
    };

    GVAR(lastSearchTextRight) = _searchString;

    // If nothing searched, quit here
    if (_searchPattern == "") exitWith {};

    private _rightPanelState = GVAR(currentLeftPanel) in [IDC_buttonPrimaryWeapon, IDC_buttonHandgun, IDC_buttonSecondaryWeapon, IDC_buttonBinoculars];
    private _rightPanelCtrl = [_display displayCtrl IDC_rightTabContentListnBox, _display displayCtrl IDC_rightTabContent] select _rightPanelState;

    // If right panel selection is weapons or binoculars
    if (_rightPanelState) then {
        // Get the currently selected item in panel
        private _selectedItemIndex = lbCurSel _rightPanelCtrl;
        private _selectedItem = "";

        // If something is selected, save it
        if (_selectedItemIndex != -1) then {
            _selectedItem = _rightPanelCtrl lbData _selectedItemIndex;
        };

        private _currentDisplayName = "";
        private _currentClassname = "";

        // Go through all items in panel and see if they need to be deleted or not
        for "_lbIndex" from (lbSize _rightPanelCtrl) - 1 to 0 step -1 do {
            _currentDisplayName = _rightPanelCtrl lbText _lbIndex;
            _currentClassname = _rightPanelCtrl lbData _lbIndex;

            // Remove item in panel if it doesn't match search, skip otherwise
            if ((_currentDisplayName == "") || {!(_currentDisplayName regexMatch _searchPattern) && {!(_currentClassname regexMatch _searchPattern)}}) then {
                _rightPanelCtrl lbDelete _lbIndex;
            };
        };

        // Try to select previously selected item again, otherwise select nothing
        if (_selectedItemIndex != -1) then {
            private _index = -1;

            // Try to find previously selected item in panel
            for "_lbIndex" from 0 to (lbSize _rightPanelCtrl) - 1 do {
                if ((_rightPanelCtrl lbData _lbIndex) == _selectedItem) exitWith {
                    _index = _lbIndex;
                };
            };

            // Select old item if found, otherwise don't select anything
            _rightPanelCtrl lbSetCurSel _index;
        } else {
            _rightPanelCtrl lbSetCurSel -1;
        };
    } else {
        // Get the currently selected item in panel
        private _selectedItemIndex = lnbCurSelRow _rightPanelCtrl;
        private _selectedItem = "";

        // If something is selected, save it
        if (_selectedItemIndex != -1) then {
            _selectedItem = _rightPanelCtrl lnbData [_selectedItemIndex, 0];
        };

        private _currentDisplayName = "";
        private _currentClassname = "";

        // Go through all items in panel and see if they need to be deleted or not
        for "_lbIndex" from (lnbSize _rightPanelCtrl select 0) - 1 to 0 step -1 do {
            _currentDisplayName = _rightPanelCtrl lnbText [_lbIndex, 1];
            _currentClassname = _rightPanelCtrl lnbData [_lbIndex, 0];

            // Remove item in panel if it doesn't match search, skip otherwise
            if ((_currentDisplayName == "") || {!(_currentDisplayName regexMatch _searchPattern) && {!(_currentClassname regexMatch _searchPattern)}}) then {
                _rightPanelCtrl lnbDeleteRow _lbIndex;
            };
        };

        // Try to select previously selected item again, otherwise select nothing
        if (_selectedItemIndex != -1) then {
            private _index = -1;

            // Try to find previously selected item in panel
            for "_lbIndex" from 0 to (lnbSize _rightPanelCtrl select 0) - 1 do {
                if ((_rightPanelCtrl lnbData [_lbIndex, 0]) == _selectedItem) exitWith {
                    _index = _lbIndex;
                };
            };

            // Select old item if found, otherwise don't select anything
            _rightPanelCtrl lnbSetCurSelRow _index;
        } else {
            _rightPanelCtrl lnbSetCurSelRow -1;
        };
    };

    [_display, nil, nil, configNull] call FUNC(itemInfo);
} else {
    // Left panel search bar
    // Don't refill if there is no need
    if (GVAR(lastSearchTextLeft) != "" && {(_searchString find GVAR(lastSearchTextLeft)) != 0}) then {
        [_display, _display displayCtrl GVAR(currentLeftPanel), _animate] call FUNC(fillLeftPanel);
    };

    GVAR(lastSearchTextLeft) = _searchString;

    // If nothing searched, quit here
    if (_searchPattern == "") exitWith {};

    private _leftPanelCtrl = _display displayCtrl IDC_leftTabContent;

    // Get the currently selected item in tree
    private _selectedPath = tvCurSel _leftPanelCtrl;
    private _selectedItem = "";

    // If something is selected, save it
    if (count _selectedPath > 0) then {
        _selectedItem = _leftPanelCtrl tvData _selectedPath;
    };

    private _currentDisplayName = "";
    private _currentClassname = "";
    private _foundMatch = false;

    // Go through all groups and items in tree to filter by search
    private _groupCount = _leftPanelCtrl tvCount [];
    for "_groupIndex" from (_groupCount - 1) to 0 step -1 do {
        private _groupHasMatches = false;
        private _itemCount = _leftPanelCtrl tvCount [_groupIndex];
        
        // Check all items in this group
        for "_itemIndex" from (_itemCount - 1) to 0 step -1 do {
            _currentDisplayName = _leftPanelCtrl tvText [_groupIndex, _itemIndex];
            _currentClassname = _leftPanelCtrl tvData [_groupIndex, _itemIndex];
            
            // Keep items that match search pattern
            if ((_currentDisplayName != "") && {(_currentDisplayName regexMatch _searchPattern) || {_currentClassname regexMatch _searchPattern}}) then {
                _groupHasMatches = true;
                
                // Track if we found the previously selected item
                if (_currentClassname == _selectedItem) then {
                    _foundMatch = true;
                };
            } else {
                // Remove items that don't match
                _leftPanelCtrl tvDelete [_groupIndex, _itemIndex];
            };
        };
        
        // Remove empty groups or groups with no matches
        if (!_groupHasMatches) then {
            _leftPanelCtrl tvDelete [_groupIndex];
        } else {
            // Expand groups that have matches for better visibility
            _leftPanelCtrl tvExpand [_groupIndex];
        };
    };

    // Try to select previously selected item again
    if (_foundMatch) then {
        private _newGroupCount = _leftPanelCtrl tvCount [];
        for "_groupIndex" from 0 to (_newGroupCount - 1) do {
            private _newItemCount = _leftPanelCtrl tvCount [_groupIndex];
            for "_itemIndex" from 0 to (_newItemCount - 1) do {
                if ((_leftPanelCtrl tvData [_groupIndex, _itemIndex]) == _selectedItem) exitWith {
                    _leftPanelCtrl tvSetCurSel [_groupIndex, _itemIndex];
                };
            };
        };
    } else {
        _leftPanelCtrl tvSetCurSel [];
    };

    [_display, nil, nil, configNull] call FUNC(itemInfo);
};

// Reset unicode flag
forceUnicode -1;
