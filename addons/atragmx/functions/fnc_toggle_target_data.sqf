#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Toggles the target data screen on/off
 *
 * Arguments:
 * Apply new data? <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_atragmx_fnc_toggle_target_data
 *
 * Public: No
 */

if (ctrlVisible 14000) then {
    false call FUNC(show_target_data);
    true call FUNC(show_main_page);

    if (_this == 1) then {
        call FUNC(calculate_target_solution);
    } else {
        call FUNC(update_target_data);
    };
} else {
    true call FUNC(show_target_data);
    false call FUNC(show_main_page);
};
