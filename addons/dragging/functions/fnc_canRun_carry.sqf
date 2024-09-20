#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Check if weight can be carried while running
 *
 * Arguments:
 * 0: Weight <NUMBER>
 *
 * Return Value:
 * Can the weight be carried while running? <BOOL>
 *
 * Example:
 * [500] call ace_dragging_fnc_canRun_carry
 *
 * Public: No
 */

params ["_weight"];

GVAR(allowRunWithLightweight) && {_weight <= GVAR(maxWeightCarryRun)}
