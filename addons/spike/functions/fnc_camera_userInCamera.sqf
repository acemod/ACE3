#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks if the user is viewing through the given camera (or any camera if none is given)
 *
 * Arguments:
 * 0: Camera <OBJECT> (default: objNull)
 *
 * Return Value:
 * User is in camera <BOOL>
 *
 * Example:
 * [cam] call ace_spike_fnc_camera_userInCamera
 *
 * Public: No
 */
if (isNil QGVAR(activeCamera)) exitWith { false };

params [["_cameraNamespace", objNull]];

(!isNull GVAR(activeCamera)) && { isNull _cameraNamespace || (_cameraNamespace isEqualTo GVAR(activeCamera)) };
