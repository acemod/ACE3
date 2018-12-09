#include "script_component.hpp"
/*
 * Author: commy2
 * Remove backpacks from Weapons filter.
 *
 * Arguments:
 * 0: Item config entry <CONFIG>
 *
 * Return Value:
 * Item should appear in this list? <BOOL>
 *
 * Example:
 * [CONFIG] call ACE_inventory_fnc_filterWeapons
 *
 * Public: No
 */

!(_this call FUNC(filterBackpacks))
