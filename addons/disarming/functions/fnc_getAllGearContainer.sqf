#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Helper function to get all gear of a container.
 *
 * Arguments:
 * 0: Container <OBJECT>
 *
 * Return Value:
 * Array of 2 arrays, classnames and count <ARRAY>
 *
 * Example:
 * cursorObject call ace_disarming_fnc_getAllGearContainer
 *
 * Public: No
 */

params ["_target"];

private _items = [];
private _counts = [];

{
    _x params ["_item", "_count"];
    _items append _item;
    _counts append _count;
} forEach [getWeaponCargo _target, getItemCargo _target, getMagazineCargo _target, getBackpackCargo _target];

[_items, _counts] // return
