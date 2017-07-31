/*
 * Author: chris579
 * Triggered when a mouse button is released on the map.
 *
 * Arguments:
 * 0: Map Control the evh was assigned to <CONTROL>
 * 1: Button code <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 2] call ace_markers_fnc_onMouseButtonUpMap
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_mapCtrl", "_button"];

player setVariable [QGVAR(moveInProgress), false];
