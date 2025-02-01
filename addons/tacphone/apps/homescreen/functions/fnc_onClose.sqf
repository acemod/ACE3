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

//#TODO when "Back to previous app" functionality is implemented, we want to just ctrlShow hide the appsection, then in createApp we can re-show the existing control

// We simply clear out the app section
ctrlDelete GVAR(appsection);