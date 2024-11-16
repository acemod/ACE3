#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Returns list of items (including magazines, backpacks and other) in a unit's inventory.
 * Number definition: 0: Do not return value, 1: Return container only, 2: Return container and content, 3: Return content only
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon items <NUMBER> (default: 2)
 * 2: Uniform items <NUMBER> (default: 2)
 * 3: Vest items <NUMBER> (default: 2)
 * 4: Backpack items <NUMBER> (default: 2)
 * 5: Assigned items <BOOL> (default: true)
 *
 * Return Value:
 * Items <HASHMAP>
 *
 * Example:
 * [player] call ace_common_fnc_uniqueUnitItems
 *
 * Public: Yes
 */

params ["_unit", ["_weaponItems", 2, [0]], ["_uniformItems", 2, [0]], ["_vestItems", 2, [0]], ["_backpackItems", 2, [0]], ["_assignedItems", true, [false]]];

// 'uniqueUnitItems' can take any number, number other than 0 and 1 have the same effect as the number '2'
private _uniqueUnitItems = uniqueUnitItems [_unit, _weaponItems, _uniformItems, _vestItems, _backpackItems, _assignedItems];

private _amount = 0;

// Remove unit's uniform, vest and backpack if there aren't in the containers themselves if necessary
{
    _x params ["_container", "_filter"];

    if ((_filter == 3) && {_container != ""}) then {
        _amount = _uniqueUnitItems get _container;

        // Delete item from hashmap if it's the only one
        if (_amount == 1) then {
            _uniqueUnitItems deleteAt _container;
        } else {
            _uniqueUnitItems set [_container, _amount - 1];
        };
    };
} forEach [[uniform _unit, _uniformItems], [vest _unit, _vestItems], [backpack _unit, _backpackItems]];

_uniqueUnitItems
