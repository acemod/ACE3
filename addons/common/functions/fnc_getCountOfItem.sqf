#include "..\script_component.hpp"
/*
 * Author: Dedmen, Blue
 * Return how many items of type _itemType the player has in his containers (Uniform, Vest, Backpack)
 * Doesn't count assignedItems, weapons, weapon attachments, magazines in weapons
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Classname of item (Case-Sensitive) <STRING>
 *
 * Return Value:
 * Item Count <NUMBER>
 *
 * Example:
 * [bob, "FirstAidKit"] call ace_common_fnc_getCountOfItem
 *
 * Public: Yes
 */

params ["_unit", "_itemType"];

private _countItemsInContainer = {
    params ["_itemType", "_container"];

    if ((_itemType call BIS_fnc_itemType) select 0 isEqualTo "Magazine") then {
        (getMagazineCargo _container) params ["_itemTypes", "_itemCounts"];

        private _index = _itemTypes find _itemType;
        _itemCounts param [_index, 0]
    } else {
        (getItemCargo _container) params ["_itemTypes", "_itemCounts"];

        private _index = _itemTypes find _itemType;
        _itemCounts param [_index, 0]
    };
};

([_itemType, uniformContainer _unit] call _countItemsInContainer) +
([_itemType, vestContainer _unit] call _countItemsInContainer) +
([_itemType, backpackContainer _unit] call _countItemsInContainer)
