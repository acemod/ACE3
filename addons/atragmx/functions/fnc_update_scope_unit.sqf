/*
 * Author: Ruthberg
 * Updates the scope unit fields
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_update_scope_unit
 *
 * Public: No
 */
#include "script_component.hpp"

ctrlSetText [2000, GVAR(scopeUnits) select (GVAR(currentScopeUnit) select GVAR(currentTarget))];
ctrlSetText [5000, GVAR(scopeUnits) select (GVAR(currentScopeUnit) select GVAR(currentTarget))];
