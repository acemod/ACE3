#include "..\script_component.hpp"
/*
 * Author: commy2
 * Filter condition for the Uniforms filter list
 *
 * Arguments:
 * 0: Item config entry <CONFIG>
 *
 * Return Value:
 * Item should appear in this list? <BOOL>
 *
 * Example:
 * [CONFIG] call ace_inventory_fnc_filterUniforms
 *
 * Public: No
 */

params ["_config"];

getNumber (_config >> "ItemInfo" >> "type") == TYPE_UNIFORM
