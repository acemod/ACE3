#include "script_component.hpp"
/*
 * Author: Vdauphin
 * Check if an item will fit in the empty space already used by loaded items.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Item <OBJECT>
 * 2: Items from vehicle cargo <OBJECT>
 *
 * Return Value:
 * Will fit or not the space occupied by items <BOOL>
 *
 * Example:
 * [] call ace_cargo_fnc_canItemCargo
 *
 * Public: No
 */

params [
    "_vehicle",
    "_item",
    ["_items", [], [[]]]
];

if (
    _items isEqualTo [] ||
    {!((_vehicle canVehicleCargo _item) select 1)}
) exitWith {false};

private _itemSurface = [_item] call FUNC(getSurfaceItem);
private _itemsSurface = 0;
{
    _itemsSurface = _itemsSurface + ([_item] call FUNC(getSurfaceItem));
} forEach _items;

_itemSurface <= _itemsSurface
