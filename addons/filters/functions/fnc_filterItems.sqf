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
 * Public: No
 */
#include "script_component.hpp"

params ["_config"];

!(getNumber (_config >> "ItemInfo" >> "type") in [TYPE_UNIFORM, TYPE_VESTS, TYPE_HEADGEAR]) && {!(_this call FUNC(filterBackpacks))}
