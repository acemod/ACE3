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
if (isNil QGVAR(activeCamera)) exitWith { false };

params [["_cameraNamespace", objNull]];

(!isNull GVAR(activeCamera)) && { isNull _cameraNamespace || (_cameraNamespace isEqualTo GVAR(activeCamera)) };
