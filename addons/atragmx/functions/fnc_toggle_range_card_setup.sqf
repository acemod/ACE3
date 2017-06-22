/*
 * Author: Ruthberg
 * Toggles the range card setup screen on/off
 *
 * Arguments:
 * Apply new range card settings <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_atragmx_fnc_toggle_range_card_setup
 *
 * Public: No
 */
#include "script_component.hpp"

if (ctrlVisible 10000) then {
    false call FUNC(show_range_card_setup);
    true call FUNC(show_range_card);

    if (_this == 1) then {
        GVAR(rangeCardStartRange) = 0 max Round(parseNumber(ctrlText 10003)) min 3000;
        GVAR(rangeCardEndRange) = 0 max Round(parseNumber(ctrlText 10004)) min 3000;
        GVAR(rangeCardIncrement) = 1 max Round(parseNumber(ctrlText 10005)) min 3000;

        [] call FUNC(calculate_range_card);
        [] call FUNC(update_range_card);
    };
} else {
    false call FUNC(show_range_card);
    true call FUNC(show_range_card_setup);
};
