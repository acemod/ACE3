#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Toggles the c1 ballistic coefficient data screen on/off
 *
 * Arguments:
 * Apply new data? <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_atragmx_fnc_toggle_c1_ballistic_coefficient_data
 *
 * Public: No
 */

if (!(missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false])) exitWith {};

if (ctrlVisible 17000) then {
    false call FUNC(show_c1_ballistic_coefficient_data);
    true call FUNC(show_main_page);

    if (_this == 1) then {
        [true, true] call FUNC(recalculate_c1_ballistic_coefficient);
        call FUNC(calculate_target_solution);
    } else {
        call FUNC(update_c1_ballistic_coefficient_data);
    };
} else {
    true call FUNC(show_c1_ballistic_coefficient_data);
    false call FUNC(show_main_page);
};
