#include "..\script_component.hpp"
/*
 * Author: KJW
 * Handle the app being closed
 *
 * Arguments:
 * TacPhone main display
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_tacphone_homescreen_fnc_onClose
 *
 * Public: No
 */

params ["_display"];

systemChat "Homescreen closed";
[{
    // All app icons are children of appsection so we'll be deleting them too
    ctrlDelete GVAR(home_appsection);
}, []] call CBA_fnc_execNextFrame;