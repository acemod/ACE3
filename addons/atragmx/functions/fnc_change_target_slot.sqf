/*
 * Author: Ruthberg
 * Selects a target slot (A, B, C or D)
 *
 * Arguments:
 * target <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 2 call ace_atragmx_fnc_change_target_slot
 *
 * Public: No
 */
#include "script_component.hpp"

private _target = 0 max _this min 3;

[] call FUNC(parse_input);

GVAR(currentTarget) = _target;
call FUNC(update_target_selection);
call FUNC(calculate_target_solution);
