/*
 * Author: Ruthberg
 * Cycles through the scope units
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_cycle_scope_unit
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(currentScopeUnit) = (GVAR(currentScopeUnit) + 1) % (count GVAR(scopeUnits));
GVAR(workingMemory) set [6, GVAR(currentScopeUnit)];

true call FUNC(show_main_page);

[] call FUNC(update_scope_unit);
[] call FUNC(update_result);
