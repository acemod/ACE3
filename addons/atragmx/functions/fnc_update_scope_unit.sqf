#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Updates the scope unit fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_scope_unit
 *
 * Public: No
 */

ctrlSetText [2000, GVAR(scopeUnits) select GVAR(currentScopeUnit)];
ctrlSetText [2001, Str(GVAR(currentScopeClickNumber))];

if (GVAR(currentScopeUnit) == 3) then {
    ctrlSetText [5000, format["Clicks=%1", GVAR(currentScopeClickNumber)]];
    if (GVAR(showMainPage)) then {
        ctrlShow [2001, true];
    };
} else {
    ctrlSetText [5000, GVAR(scopeUnits) select GVAR(currentScopeUnit)];
    ctrlShow [2001, false];
};
