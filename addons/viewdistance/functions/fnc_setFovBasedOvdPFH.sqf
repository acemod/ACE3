/*
 * Author: Jonpas
 * Sets Object View Distance dynamically based on current Field of View, between Object View Distance (minimal value) and View Distance (maximum value) set before this PFH starts.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_viewdistance_fnc_setFovBasedOvdPFH
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_idPFH"];

// Remove PFH and set Object View Distance back to what it was before
if (GVAR(objectViewDistanceCoeff) < 6) exitWith {
    [_idPFH] call CBA_fnc_removePerFrameHandler;
    GVAR(fovBasedPFHminimalViewDistance) = nil;
};

private ["_zoom"];
_zoom = (call CBA_fnc_getFov) select 1;

if (_zoom > 0.94) then {
    // Dynamically set Object View Distance based on player's Zoom Level and View Distance
	setObjectViewDistance ((_zoom/34.98 * (viewDistance - GVAR(fovBasedPFHminimalViewDistance))) + GVAR(fovBasedPFHminimalViewDistance));
} else {
	setObjectViewDistance GVAR(fovBasedPFHminimalViewDistance);
};

TRACE_2("FoV Based",getObjectViewDistance select 0,_zoom);
