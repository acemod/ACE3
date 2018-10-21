#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Updates the relative click memory
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_relative_click_memory
 *
 * Public: No
 */

GVAR(workingMemory) set [10, (GVAR(elevationOutput) select GVAR(currentTarget))];
GVAR(workingMemory) set [11, (GVAR(windage1Output) select GVAR(currentTarget))];

[] call FUNC(update_result);
