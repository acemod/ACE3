#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Brett Mayson, johnb43
 * Refreshes the arsenal to show external changes.
 *
 * Return Value:
 * None
 *
 * Public: No
*/

// Update current item list
call FUNC(updateCurrentItemsList);

// This takes care of items that aren't available in the arsenal (either wrong tab or arsenal doesn't have it whitelisted)
call FUNC(updateUniqueItemsList);

// Remove unique items in any panel that can display no or one item, but not multiple
private _items = createHashMap;
private _itemsToDelete = [];
private _index = -1;

// Add the items the player has to currentItems
{
    switch (_forEachIndex) do {
        // Primary weapon, Secondary weapon, Handgun weapon, Binoculars
        case IDX_CURR_PRIMARY_WEAPON;
        case IDX_CURR_SECONDARY_WEAPON;
        case IDX_CURR_HANDGUN_WEAPON: {
            _items = (GVAR(virtualItems) get IDX_VIRT_WEAPONS) get _forEachIndex;
            _itemsToDelete = [];

            // Remove all unique weapons in tab
            {
                if (!isNil "_y") then {
                    _itemsToDelete pushBack _x;
                };
            } forEach _items;

            {
                _items deleteAt _x;
                GVAR(virtualItemsFlatAll) deleteAt _x;
            } forEach _itemsToDelete;

            // Add weapon as a unique weapon
            if (_x != "") then {
                _items set [_x, true, true];
                GVAR(virtualItemsFlatAll) set [_x, true, true];
            };
        };
        // Weapon items
        case IDX_CURR_PRIMARY_WEAPON_ITEMS;
        case IDX_CURR_SECONDARY_WEAPON_ITEMS;
        case IDX_CURR_HANDGUN_WEAPON_ITEMS;
        case IDX_CURR_BINO_ITEMS: {
            _x params ["_muzzle", "_flashlight", "_optics", "_bipod", "_primaryMagazine", "_secondaryMagazine"];

            _index = _forEachIndex;

            // Weapon attachments
            {
                _items = (GVAR(virtualItems) get IDX_VIRT_ATTACHMENTS) get _forEachIndex;

                // Execute only once
                if (_index == IDX_CURR_PRIMARY_WEAPON_ITEMS) then {
                    _itemsToDelete = [];

                    // Remove all unique weapon attachments of concerned tab
                    {
                        if (!isNil "_y") then {
                            _itemsToDelete pushBack _x;
                        };
                    } forEach _items;

                    {
                        _items deleteAt _x;
                        GVAR(virtualItemsFlatAll) deleteAt _x;
                    } forEach _itemsToDelete;
                };

                // Add weapon attachment as a unique weapon attachment
                if (_x != "") then {
                    _items set [_x, true, true];
                    GVAR(virtualItemsFlatAll) set [_x, true, true];
                };
            } forEach [_optics, _flashlight, _muzzle, _bipod];

            // Magazines
            _items = GVAR(virtualItems) get IDX_VIRT_ITEMS_ALL;

            // Execute only once
            if (_index == IDX_CURR_PRIMARY_WEAPON_ITEMS) then {
                _itemsToDelete = [];

                // Remove all unique magazines of concerned tab
                {
                    if (!isNil "_y") then {
                        _itemsToDelete pushBack _x;
                    };
                } forEach _items;

                {
                    _items deleteAt _x;
                    GVAR(virtualItemsFlatAll) deleteAt _x;
                } forEach _itemsToDelete;
            };

            // Add magazines as unique magazines
            {
                if (_x != "") then {
                    _items set [_x, true, true];
                    GVAR(virtualItemsFlatAll) set [_x, true, true];
                };
            } forEach [_primaryMagazine, _secondaryMagazine];
        };
        // Inventory items
        case IDX_CURR_UNIFORM_ITEMS;
        case IDX_CURR_VEST_ITEMS;
        case IDX_CURR_BACKPACK_ITEMS: {};
        // Other
        default {
            _items = GVAR(virtualItems) get _forEachIndex;
            _itemsToDelete = [];

            // Remove all unique items of concerned tab
            {
                if (!isNil "_y") then {
                    _itemsToDelete pushBack _x;
                };
            } forEach _items;

            {
                _items deleteAt _x;
                GVAR(virtualItemsFlatAll) deleteAt _x;
            } forEach _itemsToDelete;

            // Add item as a unique item
            if (_x != "") then {
                _items set [_x, true, true];
                GVAR(virtualItemsFlatAll) set [_x, true, true];
            };
        };
    };
} forEach GVAR(currentItems);

// Don't refresh left panel if in loadout tab
if (!isNull findDisplay IDD_loadouts_display) exitWith {};

private _display = findDisplay IDD_ace_arsenal;

[_display, _display displayCtrl GVAR(currentLeftPanel)] call FUNC(fillLeftPanel);
