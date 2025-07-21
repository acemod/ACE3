#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Decreases zoom of current camera
 *
 * Arguments:
 * 0: Camera <OBJECT>
 * 1: Increase <BOOL
 *
 * Return Value:
 * None
 *
 * Example:
 * [cam, true] call ace_spike_fnc_camera_changeZoom
 *
 * Public: No
 */
params ["_cameraNamespace", "_increase"];

private _zoomArray = _cameraNamespace getVariable [QGVAR(fovLevels), []];

if (_zoomArray isEqualTo []) exitWith {};

private _zoomIndex = _cameraNamespace getVariable [QGVAR(currentZoomIndex), 0];

if (_increase) then {
    if ((_zoomIndex + 1) < count _zoomArray) then {
        _zoomIndex = _zoomIndex + 1;
    };
} else {
    if (_zoomIndex != 0) then {
        _zoomIndex = _zoomIndex - 1;
    };
};
[_cameraNamespace, _zoomIndex] call FUNC(camera_setZoom);
