#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Decreases zoom of current camera
 *
 * Arguments:
 * 0: Guidance Arg Array <ARRAY>
 * 1: PFID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], 0] call ace_missileguidance_fnc_guidancePFH;
 *
 * Public: No
 */
params ["_cameraNamespace", "_zoomIndex"];
private _zoomArray = _cameraNamespace getVariable [QGVAR(fovLevels), []];
_cameraNamespace setVariable [QGVAR(currentZoomIndex), _zoomIndex];
_cameraNamespace setVariable [QGVAR(targetFOV), _zoomArray select _zoomIndex];
_cameraNamespace setVariable [QGVAR(fovChanged), true];
_cameraNamespace setVariable [QGVAR(fovChangedTime), CBA_missionTime];
_cameraNamespace setVariable [QGVAR(startingFov), _cameraNamespace getVariable QGVAR(currentFOV)];

