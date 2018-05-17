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
 * [_player] call ace_common_fnc_uniqueItems
 *
 * Public: No
 */
#include "script_component.hpp"

#define ITEMS_CACHE_TIME 3600

params ["_unit"];

private _fnc_getItems = {
    params ["_unit"];

    private _items = (getItemCargo uniformContainer _unit) select 0;
    _items append ((getItemCargo vestContainer _unit) select 0);
    _items append ((getItemCargo backpackContainer _unit) select 0);

    _items arrayIntersect _items
};

// Use cached items list if unit is player
if (_unit isEqualTo ACE_player) then {
    [_unit, _fnc_getItems, _unit, QGVAR(uniqueItemsCache), ITEMS_CACHE_TIME, "cba_events_loadoutEvent"] call FUNC(cachedCall);
} else {
    _unit call _fnc_getItems;
};
