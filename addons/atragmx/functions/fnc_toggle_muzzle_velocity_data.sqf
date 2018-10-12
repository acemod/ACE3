#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Toggles the muzzle velocity data screen on/off
 *
 * Arguments:
 * Apply new data? <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_atragmx_fnc_toggle_muzzle_velocity_data
 *
 * Public: No
 */

if (!(missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false])) exitWith {};

if (ctrlVisible 16000) then {
    false call FUNC(show_muzzle_velocity_data);
    true call FUNC(show_main_page);

    if (_this == 1) then {
        [true, true] call FUNC(recalculate_muzzle_velocity);
        call FUNC(calculate_target_solution);
    } else {
        call FUNC(update_muzzle_velocity_data);
    };
} else {
    true call FUNC(show_muzzle_velocity_data);
    false call FUNC(show_main_page);
};
