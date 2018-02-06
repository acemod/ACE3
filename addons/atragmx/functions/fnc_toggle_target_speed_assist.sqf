/*
 * Author: Ruthberg
 * Toggles the target speed assist screen on/off
 *
 * Arguments:
 * update speed? <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_atragmx_fnc_toggle_target_speed_assist
 *
 * Public: No
 */
#include "script_component.hpp"

if (ctrlVisible 8000) then {
    false call FUNC(show_target_speed_assist);
    true call FUNC(show_main_page);

    if (_this == 1) then {
        [] call FUNC(calculate_target_speed_assist);
        private _targetSpeed = parseNumber(ctrlText 8007);
        if (_targetSpeed != 0) then {
            ctrlSetText [330, Str(_targetSpeed)];
            ctrlSetText [140050, Str(_targetSpeed)];
            [] call FUNC(calculate_target_solution);
        };
    };
} else {
    false call FUNC(show_main_page);
    true call FUNC(show_target_speed_assist);
};
