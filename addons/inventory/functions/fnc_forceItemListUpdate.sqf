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
 * [DISPLAY] call ACE_inventory_fnc_forceitemListUpdate
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;
params ["_display"];

private _index = GVAR(selectedFilterIndex);
private _itemList = _display call FUNC(currentItemListBox);
private _filterFunction = missionNamespace getVariable ((_display displayCtrl IDC_FILTERLISTS) lbData _index);

if (_filterFunction isEqualType {}) then {
    private _i = 0;

    while {_i < lbSize _itemList} do {
        private _config = GVAR(ItemKeyNamespace) getVariable format ["%1:%2", _itemList lbText _i, _itemList lbPicture _i];

        if (!isNil "_config" && {!(_config call _filterFunction)}) then {
            _itemList lbDelete _i;

            // in case the filter function returns nil. Otherwise could lock up the game.
            _i = _i - 1;
        };

        _i = _i + 1;
    };
};
