/*
 * Author: Garth 'L-H' de Wet
 * Returns if the camera is external or not.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Whether the camera is in external view or not. If the "showGoggles" setting is enabled in third person, this will always return false. <BOOL>
 *
 * Example:
 * [] call ace_goggles_fnc_externalCamera;
 *
 * Public: No
 */
#include "script_component.hpp"

((GVAR(showGoggles) == 1) && {cameraView in ["EXTERNAL", "GROUP"] || {call EFUNC(common,isFeatureCameraActive)}})
