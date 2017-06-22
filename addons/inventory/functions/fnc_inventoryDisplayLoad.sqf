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
 * [DISPLAY] call ACE_inventory_fnc_inventoryDisplayLoad
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;
params ["_display"];

private _filter = _display displayCtrl IDC_FILTERLISTS;

// engine defined behaviour is the following:
// lb value, data and text don't matter, only the index.
// the first three indecies are hard coded: 0 - weapons , 1 - magazines, 2 - items
// all of them show backpacks, because BI
// all other indecies show everything, so all we have to do is delete stuff we dont like
_filter ctrlAddEventHandler ["LBSelChanged", {_this call FUNC(onLBSelChanged)}];

// have to add these a frame later, because this event happens before the engine adds the default filters
[{
    disableSerialization;
    params ["_filter"];

    // remove "All", so we can push it to the back later.
    // to keep localization we can keep the lbText (displayed name).
    private _index = lbSize _filter - 1;
    private _nameAll = _filter lbText _index;
    _filter lbDelete _index;

    // add additional filter functions to the default filters. These remove backpacks etc.
    _filter lbSetData [0, QFUNC(filterWeapons)];
    _filter lbSetData [1, QFUNC(filterMagazines)];
    _filter lbSetData [2, QFUNC(filterItems)];

    // add our custom filters
    {
        _x params ["_name", "_fncName"];

        _index = _filter lbAdd _name;
        _filter lbSetData [_index, _fncName];

        false
    } count GVAR(customFilters);

    // readd "All" filter to last position and select it
    _index = _filter lbAdd _nameAll;
    _filter lbSetCurSel _index;
}, [_filter]] call CBA_fnc_execNextFrame;

// monitor changes that can happen and force our update
private _dummyControl = _display ctrlCreate ["RscMapControl", -1];

_dummyControl ctrlSetPosition [0,0,0,0];
_dummyControl ctrlCommit 0;

_dummyControl ctrlAddEventHandler ["Draw", {
    disableSerialization;
    params ["_dummyControl"];

    private _display = ctrlParent _dummyControl;

    private _itemList = _display call FUNC(currentItemListBox);

    // monitoring is done by setting a lb value. These are unused here and are reset every time the list box updates.
    if (_itemList lbValue 0 != DUMMY_VALUE) then {
        _display call FUNC(forceItemListUpdate);
        _itemList lbSetValue [0, DUMMY_VALUE];
    };
}];
