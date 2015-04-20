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

if (GVAR(currentScopeUnit) == 3) then {
    ctrlSetText [2000, format["Clicks=%1", GVAR(currentScopeClickNumber)]];
    ctrlSetText [5000, format["Clicks=%1", GVAR(currentScopeClickNumber)]];
} else {
    ctrlSetText [2000, GVAR(scopeUnits) select GVAR(currentScopeUnit)];
    ctrlSetText [5000, GVAR(scopeUnits) select GVAR(currentScopeUnit)];
};
