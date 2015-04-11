/*
 * Author: Ruthberg
 * Toggles the gun list screen on/off
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_toggle_gun_list
 *
 * Public: No
 */
#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

if (ctrlVisible 6000) then
{
    false call FUNC(show_gun_list);
    true call FUNC(show_main_page);
    
    if (_this) then {
        (lbCurSel 6000) call FUNC(change_gun);
    };
} else
{
    false call FUNC(show_main_page);
    true call FUNC(show_gun_list);
    
    ctrlSetFocus (_dsp displayCtrl 6002);

    lbSetCurSel [6000, (GVAR(currentGun) select GVAR(currentTarget))];
};
