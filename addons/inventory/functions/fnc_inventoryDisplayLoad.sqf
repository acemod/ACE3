#include "..\script_component.hpp"
/*
 * Author: commy2
 * Executed every time an inventory display is opened.
 *
 * Arguments:
 * 0: Inventory display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY] call ace_inventory_fnc_inventoryDisplayLoad
 *
 * Public: No
 */

disableSerialization;

params ["_display"];

private _filter = _display displayCtrl IDC_FILTERLISTS;

// Engine defined behaviour is the following:
// lb value, data and text don't matter, only the index.
// The first three indecies are hard coded: 0 - weapons , 1 - magazines, 2 - items
// All of them show backpacks, because BI
// All other indecies show everything, so all we have to do is delete stuff we don't like
_filter ctrlAddEventHandler ["LBSelChanged", LINKFUNC(onLBSelChanged)];

// Have to add these a frame later, because this event happens before the engine adds the default filters
[{
    disableSerialization;

    params ["_filter"];

    // Remove "All", so we can push it to the back later
    // To keep localization we keep the lbText (displayed name)
    private _index = lbSize _filter - 1;
    private _nameAll = _filter lbText _index;
    _filter lbDelete _index;

    // Add additional filter functions to the default filters. These remove backpacks etc.
    _filter lbSetData [0, QFUNC(filterWeapons)];
    _filter lbSetData [1, QFUNC(filterMagazines)];
    _filter lbSetData [2, QFUNC(filterItems)];

    // Add our custom filters
    {
        _x params ["_name", "_fncName"];

        _index = _filter lbAdd _name;
        _filter lbSetData [_index, _fncName];
    } forEach GVAR(customFilters);

    // Readd "All" filter to last position and select it
    _index = _filter lbAdd _nameAll;
    _filter lbSetCurSel _index;
}, _filter] call CBA_fnc_execNextFrame;

// Monitor changes that can happen and force our update
private _dummyControl = _display ctrlCreate ["RscMapControl", -1];

_dummyControl ctrlSetPosition [0, 0, 0, 0];
_dummyControl ctrlCommit 0;

_dummyControl ctrlAddEventHandler ["Draw", {
    (ctrlParent (_this select 0)) call FUNC(forceItemListUpdate);
}];
