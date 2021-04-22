#include "script_component.hpp"
/*
 * Author: Dedmen
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
    (getItemCargo _this) params ["_itemTypes", "_itemCounts"];

    private _index = _itemTypes find _itemType;
    _itemCounts param [_index, 0]
};

((uniformContainer _unit) call _countItemsInContainer) +
((vestContainer _unit) call _countItemsInContainer) +
((backpackContainer _unit) call _countItemsInContainer)
