/*
 * Author: commy2
 * Returns a value depending on current zoom level.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Zoom <NUMBER>
 *
 * Example:
 * [] call ace_common_fnc_getZoom
 *
 * Public: Yes
 */
#include "script_component.hpp"

if (!hasInterface) exitWith {0};

(0.5 - ((worldToScreen positionCameraToWorld [0, 1, 1]) select 1)) * (getResolution select 5)
