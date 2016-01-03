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
#include "script_component.hpp"

cameraView in ["EXTERNAL", "GROUP"] || EFUNC(common,isFeatureCameraActive) // return
