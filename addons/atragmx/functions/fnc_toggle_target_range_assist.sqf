/*
 * Author: Ruthberg
 * Toggles the target range assist screen on/off
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_toggle_target_range_assist
 *
 * Public: No
 */
#include "script_component.hpp"

if (ctrlVisible 7000) then
{
    false call FUNC(show_target_range_assist);
    true call FUNC(show_main_page);
    
    if (_this == 1) then
    {
        ctrlSetText [320, Str(parseNumber(ctrlText 7012))];
        ctrlSetText [340, Str(parseNumber(ctrlText 7013))];
    };
} else
{
    false call FUNC(show_main_page);
    true call FUNC(show_target_range_assist);
};
