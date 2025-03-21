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
 * [] call ace_tacphone_bft_fnc_onClose
 *
 * Public: No
 */

params ["_display"];

systemChat "BFT closed";
// We simply clear out the app section
ctrlDelete GVAR(appsection);