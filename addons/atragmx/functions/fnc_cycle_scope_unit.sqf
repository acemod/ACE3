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

GVAR(currentScopeUnit) set [GVAR(currentTarget), ((GVAR(currentScopeUnit) select GVAR(currentTarget)) + 1) % (count GVAR(scopeUnits))];

[] call FUNC(update_scope_unit);
[] call FUNC(update_result);
