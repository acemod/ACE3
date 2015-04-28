/*
 * Author: Ruthberg
 * Cycles through the scope units
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_cycle_scope_unit
 *
 * Public: No
 */
#include "script_component.hpp"

[] call FUNC(parse_input);

GVAR(currentScopeUnit) = (GVAR(currentScopeUnit) + 1) % (count GVAR(scopeUnits));
GVAR(workingMemory) set [6, GVAR(currentScopeUnit)];

[] call FUNC(update_scope_unit);
[] call FUNC(update_result);
