#include "..\script_component.hpp"
/*
 * Author: KJW
 * Handle the app being closed
 *
 * Arguments:
 * 0: TacPhone main display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_tacphone_groups_fnc_onClose
 *
 * Public: No
 */

params ["_display"];

systemChat "Group Management closed";
[{
    // All app icons are children of appsection so we'll be deleting them too
    ctrlDelete GVAR(appsection);
}, []] call CBA_fnc_execNextFrame;