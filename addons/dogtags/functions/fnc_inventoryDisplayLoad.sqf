#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Executed every time an inventory display is opened.
 *
 * Arguments:
 * 0: Inventory display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY] call ace_dogtags_fnc_inventoryDisplayLoad
 *
 * Public: No
 */

disableSerialization;

params ["_display"];

// Monitor changes that can happen and force our update
private _dummyControl = _display ctrlCreate ["RscMapControl", -1];

_dummyControl ctrlSetPosition [0, 0, 0, 0];
_dummyControl ctrlCommit 0;

_dummyControl ctrlAddEventHandler ["Draw", {
    private _display = ctrlParent (_this select 0);

    {
        private _itemList = _display displayCtrl _x;

        // If control isn't shown, skip
        if (!ctrlShown _itemList) then {
            continue;
        };

        for "_i" from (lbSize _itemList) to 0 step -1 do {
            private _item = _itemList lbData _i;

            if (_item find "ACE_dogtag_" == 0) then {
                _dogtagData = GVAR(dogtagsData) getOrDefault [_item, []];

                // If data doesn't exist, put name as "unknown"
                _itemList lbSetText [_i, [LLSTRING(itemName), ": ", _dogtagData param [0, LELSTRING(common,unknown)]] joinString ""];
            };
        };
    } forEach [IDC_ITEMLIST_GROUND, IDC_ITEMLIST_SOLDIER, IDC_ITEMLIST_UNIFORM, IDC_ITEMLIST_VEST, IDC_ITEMLIST_BACKPACK];
}];
