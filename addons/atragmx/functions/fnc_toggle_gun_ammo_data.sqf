#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Toggles the gun ammo data screen on/off
 *
 * Arguments:
 * Apply new data? <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_atragmx_fnc_toggle_gun_ammo_data
 *
 * Public: No
 */

if (ctrlVisible 12000) then {
    false call FUNC(show_gun_ammo_data);
    true call FUNC(show_main_page);

    if (_this == 1) then {
        GVAR(truingDropDropData) set [0, 0];
        call FUNC(update_zero_range);
        call FUNC(calculate_target_solution);
    } else {
        call FUNC(update_gun_ammo_data);
    };
} else {
    true call FUNC(show_gun_ammo_data);
    false call FUNC(show_main_page);
};
