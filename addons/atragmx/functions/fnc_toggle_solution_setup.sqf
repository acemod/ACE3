#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Toggles the solution setup screen on/off
 *
 * Arguments:
 * Apply new data? <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_atragmx_fnc_toggle_solution_setup
 *
 * Public: No
 */

if (ctrlVisible 15000) then {
    false call FUNC(show_solution_setup);
    true call FUNC(show_main_page);

    if (_this == 1) then {
        GVAR(currentScopeClickUnit) = GVAR(currentScopeClickUnitTemp);
        GVAR(currentScopeClickNumber) = GVAR(currentScopeClickNumberTemp);
        GVAR(workingMemory) set [7, GVAR(currentScopeClickUnit)];
        GVAR(workingMemory) set [8, GVAR(currentScopeClickNumber)];
       [] call FUNC(update_scope_unit);
       [] call FUNC(update_result);
    };
} else {
    true call FUNC(show_solution_setup);
    false call FUNC(show_main_page);

    GVAR(currentScopeClickUnitTemp) = GVAR(currentScopeClickUnit);
    GVAR(currentScopeClickNumberTemp) = GVAR(currentScopeClickNumber);

    [] call FUNC(update_solution_setup);
};
