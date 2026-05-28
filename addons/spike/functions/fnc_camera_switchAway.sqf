#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Switches away from the currently controlled camera
 *
 * Arguments:
 * 0: Camera <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cam] call ace_spike_fnc_camera_switchAway
 *
 * Public: No
 */
params [["_cameraNamespace", objNull]];

if !([_cameraNamespace] call FUNC(camera_userInCamera)) exitWith {};

private _camera = GVAR(activeCamera) getVariable QGVAR(camera);
_camera cameraEffect ["terminate", "back"];
GVAR(activeCamera) = objNull;

QGVAR(camera_hud) cutText ["", "PLAIN"];
