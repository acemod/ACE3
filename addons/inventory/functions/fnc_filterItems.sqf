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

!(_this call FUNC(filterMedical)) &&
{!(_this call FUNC(filterBackpacks))} &&
{!(_this call FUNC(filterHeadgear))} &&
{!(getNumber (_config >> "ItemInfo" >> "type") in [TYPE_UNIFORM, TYPE_VEST])}
