#include "script_component.hpp"
/*
 * Author: mharis001
 * Function used to handle unload event.
 *
 * Arguments:
 * 0: Spectator display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_ui_handleUnload
 *
 * Public: No
 */

params ["_display"];

[QGVAR(displayUnloaded), _display] call CBA_fnc_localEvent;
