#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Toggles the truing drop screen on/off
 *
 * Arguments:
 * Apply new data? <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_atragmx_fnc_toggle_truing_drop
 *
 * Public: No
 */

if (!(missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false])) exitWith {};

if (ctrlVisible 18000) then {
    false call FUNC(show_truing_drop);
    true call FUNC(show_main_page);

    if (_this == 1) then {
        if (GVAR(truingDropMode) == 0) then {
            [GVAR(temperature), GVAR(truingDropMuzzleVelocity)] call FUNC(insert_muzzle_velocity_data);
            [false, true] call FUNC(recalculate_muzzle_velocity);
        } else {
            [GVAR(truingDropRangeData) select 0, GVAR(truingDropRangeData) select 1, GVAR(truingDropC1)] call FUNC(insert_c1_ballistic_coefficient_data);
            [false, true] call FUNC(recalculate_c1_ballistic_coefficient);
        };
        call FUNC(calculate_target_solution);
    } else {
        call FUNC(update_truing_drop_data);
    };
} else {
    false call FUNC(show_main_page);
    true call FUNC(show_truing_drop);
};
