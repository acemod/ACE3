#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Returns if the camera is external or not.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Whether the camera is in external view or not. <BOOL>
 *
 * Example:
 * call ace_goggles_fnc_externalCamera;
 *
 * Public: Yes
 */

// Handle the ThreeDen Editor Camera
if (is3DEN) exitWith {true};

private _isFeatureCamera = call CBA_fnc_getActiveFeatureCamera != "";
if (GVAR(showInThirdPerson)) then {
    cameraView in ["GROUP"] || _isFeatureCamera
} else {
    cameraView in ["EXTERNAL", "GROUP"] || _isFeatureCamera
};
