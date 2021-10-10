#include "script_component.hpp"
/*
 * Author: chris579
 * Triggered when a mouse button is released on the map.
 *
 * Arguments:
 * 0: Map Control the evh was assigned to <CONTROL>
 * 1: Button code <NUMBER>
 * 2: Position of x <NUMBER>
 * 3: Position of y <NUMBER>
 * 4: State of Shift <BOOL>
 * 5: State of Ctrl <BOOL>
 * 6: State of Alt <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 2] call ace_markers_fnc_onMouseButtonUp
 *
 * Public: No
 */

params ["_ctrlMap", "_button", "_x", "_y", "_shift", "_ctrl", "_alt"];

GVAR(moving) = false;
