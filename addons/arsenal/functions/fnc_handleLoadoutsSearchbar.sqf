#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Handles keyboard inputs inside the searchbars text boxes.
 *
 * Arguments:
 * 0: Loadouts display <DISPLAY>
 * 1: Searchbar control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control"];

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;

// Get the currently selected item in panel
private _selectedLoadoutIndex = lnbCurSelRow _contentPanelCtrl;
private _selectedLoadout = "";

// If something is selected, save it
if (_selectedLoadoutIndex != -1) then {
    _selectedLoadout = _contentPanelCtrl lnbText [_selectedLoadoutIndex, 1];
};

private _searchString = ctrlText _control;

// Don't refill if there is no need
if (GVAR(lastSearchTextLoadouts) != "" && {(_searchString find GVAR(lastSearchTextLoadouts)) != 0}) then {
    [_display, _display displayCtrl GVAR(currentLoadoutsTab)] call FUNC(fillLoadoutsList);
};

GVAR(lastSearchTextLoadouts) = _searchString;

// If nothing searched, quit here
if (_searchString != "") then {
    _searchString = toLower _searchString;

    private _loadoutName = "";
    private _loadout = [];
    private _currentTab = str GVAR(currentLoadoutsTab);

    // Go through all items in panel and see if they need to be deleted or not
    for "_lbIndex" from (lnbSize _contentPanelCtrl select 0) - 1 to 0 step -1 do {
        _loadoutName = toLower (_contentPanelCtrl lnbText [_lbIndex, 1]);

        // Remove item in panel if it doesn't match search, skip otherwise
        if ((_loadoutName == "") || {!(_searchString in _loadoutName)}) then {
            _contentPanelCtrl lnbDeleteRow _lbIndex;
        };
    };
};

// Try to select previously selected item again, otherwise select nothing
if (_selectedLoadoutIndex != -1) then {
    private _index = -1;

    for "_lbIndex" from 0 to (lnbSize _contentPanelCtrl select 0) - 1 do {
        if ((_contentPanelCtrl lnbText [_lbIndex, 1]) == _selectedLoadout) exitWith {
            _index = _lbIndex;
        };
    };

    _contentPanelCtrl lnbSetCurSelRow _index;
} else {
    _contentPanelCtrl lnbSetCurSelRow -1;
};
