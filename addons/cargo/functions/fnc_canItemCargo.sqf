#include "..\script_component.hpp"
/*
 * Author: Vdauphin
 * Checks if an item would fit in the space currently used by loaded items.
 *
 * Arguments:
 * 0: Item <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Items from vehicle cargo <OBJECT>
 *
 * Return Value:
 * Ig the item would fit or not <BOOL>
 *
 * Example:
 * ["ACE_Wheel", cursorObject, []] call ace_cargo_fnc_canItemCargo
 *
 * Public: No
 */

params ["_item", "_vehicle", "_items"];

// If there are no items or if the item can't fit in the vehicle when empty, skip
if (_items isEqualTo [] || {!((_vehicle canVehicleCargo _item) select 1)}) exitWith {false};

private _itemSurface = _item call FUNC(getSurfaceItem);
private _itemsSurface = 0;

{
    _itemsSurface = _itemsSurface + (_item call FUNC(getSurfaceItem));
} forEach _items;

_itemSurface <= _itemsSurface
