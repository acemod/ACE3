#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Remove virtual items to the provided target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Items <ARRAY of STRINGS>, <BOOL>
 * 2: Add globally <BOOL> (Optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_removeVirtualItems
 * [_box, true, false] call ace_arsenal_fnc_removeVirtualItems
 *
 * Public: Yes
*/

params [["_object", objNull, [objNull]], ["_items", [], [true, [""]]], ["_global", false, [false]]];

if (isNull _object || {_items isEqualTo []}) exitWith {};

if (_items isEqualType true) then {
    if (_items) then {
        [_object, _global] call FUNC(removeBox);
    };
} else {
    // Make sure all items are in string form, then convert to config case (non-existent items return "")
    _items = (_items select {_x isEqualType ""}) apply {_x call EFUNC(common,getConfigName)};

    // Remove any invalid/non-existing items
    _items = _items - [""];

    private _cargo = _object getVariable [QGVAR(virtualItems), EMPTY_VIRTUAL_ARSENAL];
    private _isEmpty = true;
    private _newItems = [];

    // Remove items from lists
    {
        switch (_forEachIndex) do {
            // Weapons
            case IDX_VIRT_WEAPONS: {
                _cargo set [_forEachIndex, [
                    (_x select IDX_VIRT_PRIMARY_WEAPONS) - _items,
                    (_x select IDX_VIRT_SECONDARY_WEAPONS) - _items,
                    (_x select IDX_VIRT_HANDGUN_WEAPONS) - _items
                ]];

                // Check that there are still items left in the arsenal
                _isEmpty = (_cargo select _forEachIndex) isEqualTo [[], [], []];
            };
            // Weapon attachments
            case IDX_VIRT_ATTACHMENTS: {
                _cargo set [_forEachIndex, [
                    (_x select IDX_VIRT_OPTICS_ATTACHMENTS) - _items,
                    (_x select IDX_VIRT_FLASHLIGHT_ATTACHMENTS) - _items,
                    (_x select IDX_VIRT_MUZZLE_ATTACHMENTS) - _items,
                    (_x select IDX_VIRT_BIPOD_ATTACHMENTS) - _items
                ]];

                // Check that there are still items left in the arsenal
                _isEmpty = _isEmpty && {(_cargo select _forEachIndex) isEqualTo [[], [], [], []]};
            };
            // Rest
            default {
               _newItems = _x - _items;
               _cargo set [_forEachIndex, _newItems];

               // Check that there are still items left in the arsenal
               _isEmpty = _isEmpty && {_newItems isEqualTo []};
           };
        };
    } forEach _cargo;

    // If nothing is left, remove arsenal from object
    if (_isEmpty) then {
        [_object, _global] call FUNC(removeBox);
    } else {
        _object setVariable [QGVAR(virtualItems), _cargo, _global];
    };
};
