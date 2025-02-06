#include "..\script_component.hpp"
/*
 * Author: commy2
 * Remove uniforms, vests and backpacks from Items filter.
 *
 * Arguments:
 * 0: Item config entry <CONFIG>
 *
 * Return Value:
 * Item should appear in this list? <BOOL>
 *
 * Example:
 * [CONFIG] call ace_inventory_fnc_filterItems
 *
 * Public: No
 */

params ["_config"];

!(call FUNC(filterMedical)) &&
{!(call FUNC(filterBackpacks))} &&
{!(call FUNC(filterHeadgear))} &&
{!(getNumber (_config >> "ItemInfo" >> "type") in [TYPE_UNIFORM, TYPE_VEST])}
