#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Resets the relative click memory and updates the result input/output fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_reset_relative_click_memory
 *
 * Public: No
 */

GVAR(workingMemory) set [10, 0];
GVAR(workingMemory) set [11, 0];

[] call FUNC(update_result);
