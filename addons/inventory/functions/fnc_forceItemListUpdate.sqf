#include "..\script_component.hpp"
/*
 * Author: commy2
 * Updates item list and removes every entry that does not fit in the currently selected filter list.
 *
 * Arguments:
 * 0: Inventory display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY] call ace_inventory_fnc_forceItemListUpdate
 *
 * Public: No
 */

disableSerialization;

params ["_display"];

// Get the appropriate filter
private _filterFunction = missionNamespace getVariable [(_display displayCtrl IDC_FILTERLISTS) lbData GVAR(selectedFilterIndex), ""];

if !(_filterFunction isEqualType {}) exitWith {};

private _itemList = _display call FUNC(currentItemListBox);
private _itemKeyCache = uiNamespace getVariable QGVAR(itemKeyCache);
private _backpackKeyCache = uiNamespace getVariable QGVAR(backpackKeyCache);
private _config = configNull;

for "_i" from (lbSize _itemList) - 1 to 0 step -1 do {
    // All items have their classnames in lbData, except backpacks
    private _className = _itemList lbData _i;

    _config = if (_className != "") then {
        _itemKeyCache get _className
    } else {
        // Backpack are gotten with their display name and inventory icon
        _backpackKeyCache get format ["%1:%2", _itemList lbText _i, _itemList lbPicture _i]
    };

    // If item is valid and doesn't match the current filter, remove it
    if (!isNil "_config" && {!(_config call _filterFunction)}) then {
        _itemList lbDelete _i;
    };
};
