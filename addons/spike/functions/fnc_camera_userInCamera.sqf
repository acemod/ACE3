#include "..\script_component.hpp"
/*
 * Author: Dani (TCVM)
 * Switches away from the currently controlled camera
 *
 * Arguments:
 * 0: Camera <OBJECT>
 *
 * Return Value:
 * <BOOL>
 *
 * Example:
 * [cam] call ace_spike_fnc_camera_userInCamera
 *
 * Public: No
 */
params [["_cameraNamespace", objNull]];

if (isNil QGVAR(activeCamera)) exitWith { false };

(!isNull GVAR(activeCamera)) && { isNull _cameraNamespace || (_cameraNamespace isEqualTo GVAR(activeCamera)) };
