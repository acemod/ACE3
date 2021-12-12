#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Handle key presses
 *
 * Arguments:
 * 0: Key Pressed <NUMBER>
 * 1: Down <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [5, true] call ace_spike_keyDown;
 *
 * Public: No
 */
params ["_key", "_down"];

_this call FUNC(camera_handleKeyPress);
