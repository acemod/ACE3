#include "..\script_component.hpp"
/*
 * Author: commy2
 * Remove backpacks and grenades from Magazines filter.
 *
 * Arguments:
 * 0: Item config entry <CONFIG>
 *
 * Return Value:
 * Item should appear in this list? <BOOL>
 *
 * Example:
 * [CONFIG] call ace_inventory_fnc_filterMagazines
 *
 * Public: No
 */

!(call FUNC(filterGrenades)) && {!(call FUNC(filterBackpacks))}
