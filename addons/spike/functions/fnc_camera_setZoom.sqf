#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Decreases zoom of current camera
 *
 * Arguments:
 * 0: Camera <OBJECT>
 * 1: Zoom Index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cam, 1] call ace_spike_fnc_camera_setZoom
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
