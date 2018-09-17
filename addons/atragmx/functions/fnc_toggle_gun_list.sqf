#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Toggles the gun list screen on/off
 *
 * Arguments:
 * change gun? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_toggle_gun_list
 *
 * Public: No
 */

if (ctrlVisible 6000) then {
    false call FUNC(show_gun_list);
    true call FUNC(show_main_page);

    if (_this) then {
        [lbCurSel 6000, true, true] call FUNC(change_gun);
    };
} else {
    false call FUNC(show_main_page);
    true call FUNC(show_gun_list);
};
