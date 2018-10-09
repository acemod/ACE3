#include "script_component.hpp"
/*
 * Author: commy2
 * Filter condition for the Backpacks filter list
 *
 * Arguments:
 * 0: Item config entry <CONFIG>
 *
 * Return Value:
 * Item should appear in this list? <BOOL>
 *
 * Example:
 * [CONFIG] call ACE_inventory_fnc_filterBackpacks
 *
 * Public: No
 */

params ["_config"];

getNumber (_config >> "isBackpack") == 1
