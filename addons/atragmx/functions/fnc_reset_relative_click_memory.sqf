/*
 * Author: Ruthberg
 * Resets the relative click memory and updates the result input/output fields
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_reset_relative_click_memory
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(workingMemory) set [10, 0];
GVAR(workingMemory) set [11, 0];

[] call FUNC(update_result);
