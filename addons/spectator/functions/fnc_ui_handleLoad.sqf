#include "script_component.hpp"
/*
 * Author: SilentSpike, Jonpas
 * Function used to handle load event.
 *
 * Arguments:
 * 0: Spectator display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_ui_handleLoad
 *
 * Public: No
 */

params ["_display"];

uiNamespace setVariable [QGVAR(display), _display];

// Handle ACRE2 Toggle Spectator (if present)
if (!isNil "acre_api_fnc_addDisplayPassthroughKeys") then {
    [_display] call acre_api_fnc_addDisplayPassthroughKeys;
};
