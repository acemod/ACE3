#include "..\script_component.hpp"
/*
 * Author: mharis001, Blue, Brett Mayson
 * Returns list of unique items in the target's inventory.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Include magazines <NUMBER> (default: 0)
 *   0: No
 *   1: Yes
 *   2: Only magazines
 *
 * Return Value:
 * Items <ARRAY>
 *
 * Example:
 * [player, 2] call ace_common_fnc_uniqueItems
 *
 * Public: No
 */

params ["_target", ["_includeMagazines", 0]];

private _fnc_getItems = {
    private _items = [];

    private _inventoryItems = (getItemCargo uniformContainer _target) select 0;
    _inventoryItems append ((getItemCargo vestContainer _target) select 0);
    _inventoryItems append ((getItemCargo backpackContainer _target) select 0);

    private _magazines = magazines _target;

    _items set [0, _inventoryItems arrayIntersect _inventoryItems];
    _items set [1, _magazines arrayIntersect _magazines];

    _items
};

// Cache items list if unit is ACE_player
if (_target isEqualTo ACE_player) then {
    if (isNil QGVAR(uniqueItemsCache)) then {
        GVAR(uniqueItemsCache) = call _fnc_getItems;
    };

    switch (_includeMagazines) do {
        case 0: {
            GVAR(uniqueItemsCache) select 0
        };
        case 1: {
            (GVAR(uniqueItemsCache) select 1) + (GVAR(uniqueItemsCache) select 0)
        };
        case 2: {
            GVAR(uniqueItemsCache) select 1
        };
    };
} else {
    if (_target isKindOf "CAManBase") then {
        private _items = call _fnc_getItems;

        switch (_includeMagazines) do {
            case 0: {
                _items select 0
            };
            case 1: {
                (_items select 1) + (_items select 0)
            };
            case 2: {
                _items select 1
            };
        };
    } else {
        private _items = switch (_includeMagazines) do {
            case 0: {
                itemCargo _target
            };
            case 1: {
                (magazineCargo _target) + (itemCargo _target)
            };
            case 2: {
                magazineCargo _target
            };
        };

        _items arrayIntersect _items
    };
};
