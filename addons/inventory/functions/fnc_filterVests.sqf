/*
 * Author: commy2
 * Filter condition for the Vests filter list
 *
 * Arguments:
 * 0: Item config entry <CONFIG>
 *
 * Return Value:
 * Item should appear in this list? <BOOL>
 *
 * Example:
 * [CONFIG] call ACE_inventory_fnc_filterVests
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_config"];

getNumber (_config >> "ItemInfo" >> "type") == TYPE_VEST
