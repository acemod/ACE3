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

!(_this call FUNC(filterUniforms)) && {!(_this call FUNC(filterVests))} && {!(_this call FUNC(filterBackpacks))}
