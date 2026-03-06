#include "..\script_component.hpp"
/*
 * Author: KJW
 * Handle the app being closed
 *
 * Arguments:
 * 0: Tacphone main display <DISPLAY>
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

[QGVAR(phoneClosed), _display] call CBA_fnc_localEvent;

systemChat "BFT closed";
// We simply clear out the app section
ctrlDelete (uiNamespace getVariable [QGVAR(appSection),controlNull]);
