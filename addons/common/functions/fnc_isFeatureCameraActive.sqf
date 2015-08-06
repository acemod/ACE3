/*
 * Author: Sniperwolf572
 *
 * Checks if one of the following BI feature cameras are active:
 *
 * - Classic camera (BIS_fnc_cameraOld)
 * - Splendid camera (BIS_fnc_camera)
 * - Arsenal camera (BIS_fnc_arsenal)
 * - Animation viewer (BIS_fnc_animViewer)
 * - Establishing shot (BIS_fnc_establishingShot)
 *
 * Arguments:
 * None
 *
 * Return value:
 * Is BI feature camera active (BOOLEAN)
 *
 * Example:
 * call ace_common_fnc_isFeatureCameraActive;
 *
 * Public: No
 */

#include "script_component.hpp"

(
    !isNull (missionNamespace getVariable ["BIS_DEBUG_CAM", objNull]) || // Classic camera
    {!isNull (missionNamespace getVariable ["BIS_fnc_camera_cam", objNull])} || // Splendid camera
    {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])} || // Arsenal camera
    {!isNull (uiNamespace getVariable ["BIS_fnc_animViewer_cam", objNull])} || // Animation viewer camera
    {!isNull (missionNamespace getVariable ["BIS_fnc_establishingShot_fakeUAV", objNull])} // Establishing shot camera
)
