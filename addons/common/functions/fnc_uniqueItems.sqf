#include "script_component.hpp"
/*
 * Author: mharis001
 * Returns list of unique items in a unit's inventory.
 * Items are cached if unit is ACE_player.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Items <ARRAY>
 *
 * Example:
 * [player] call ace_common_fnc_uniqueItems
 *
 * Public: No
 */

params ["_unit"];

private _fnc_getItems = {
    private _items = (getItemCargo uniformContainer _unit) select 0;
    _items append ((getItemCargo vestContainer _unit) select 0);
    _items append ((getItemCargo backpackContainer _unit) select 0);

    _items arrayIntersect _items
};

// Use cached items list if unit is ACE_player
if (_unit isEqualTo ACE_player) then {
    if (isNil QGVAR(uniqueItemsCache)) then {
        GVAR(uniqueItemsCache) = call _fnc_getItems;
    };
    +GVAR(uniqueItemsCache)
} else {
    call _fnc_getItems;
};
