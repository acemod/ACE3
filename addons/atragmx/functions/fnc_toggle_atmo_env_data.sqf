#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Toggles the atmospheric data screen on/off
 *
 * Arguments:
 * Apply new data? <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_atragmx_fnc_toggle_atmo_env_data
 *
 * Public: No
 */

if (ctrlVisible 13000) then {
    false call FUNC(show_atmo_env_data);
    true call FUNC(show_main_page);

    if (_this == 1) then {
        GVAR(truingDropDropData) set [0, 0];
        [true, true] call FUNC(recalculate_muzzle_velocity);
        call FUNC(calculate_target_solution);
    } else {
        call FUNC(update_atmo_env_data);
    };
} else {
    true call FUNC(show_atmo_env_data);
    false call FUNC(show_main_page);
};
