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
params ["_cameraNamespace", "_increase"];

private _zoomIndex = _cameraNamespace getVariable [QGVAR(currentZoomIndex), 0];
private _zoomArray = _cameraNamespace getVariable [QGVAR(fovLevels), []];

if ((count _zoomArray) == 0) exitWith {};
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

