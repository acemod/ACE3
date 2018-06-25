#include "script_component.hpp"
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

GVAR(currentTarget) = 0 max _this min 3;

GVAR(targetRangeDirtyFlag) = true;

call FUNC(update_target_selection);
call FUNC(calculate_target_solution);
