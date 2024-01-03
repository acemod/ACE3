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
 * [DISPLAY] call ACE_inventory_fnc_forceitemListUpdate
 *
 * Public: No
 */

disableSerialization;
params ["_display"];

private _itemList = _display call FUNC(currentItemListBox);
private _filterFunction = missionNamespace getVariable ((_display displayCtrl IDC_FILTERLISTS) lbData GVAR(selectedFilterIndex));

if (_filterFunction isEqualType {}) then {
    for "_i" from (lbSize _itemList) - 1 to 0 step -1 do {
        private _config = GVAR(ItemKeyNamespace) getVariable format ["%1:%2", _itemList lbText _i, _itemList lbPicture _i];

        if (!isNil "_config" && {!(_config call _filterFunction)}) then {
            _itemList lbDelete _i;
        };
    };
};
