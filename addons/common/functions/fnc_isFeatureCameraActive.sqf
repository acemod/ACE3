#include "script_component.hpp"
/*
 * Author: Sniperwolf572
 * Checks if one of the following common feature cameras is active:
 *
 * - Curator
 * - ACE Spectator
 * - Arsenal camera (BIS_fnc_arsenal)
 * - Nexus Spectator (BIS_fnc_EGSpectator)
 * - Establishing shot (BIS_fnc_establishingShot)
 * - Splendid camera (BIS_fnc_camera)
 * - Animation viewer (BIS_fnc_animViewer)
 * - Classic camera (BIS_fnc_cameraOld)
 *
 * Arguments:
 * 0: None <NIL>
 *
 * Return Value:
 * A feature camera is active <BOOL>
 *
 * Example:
 * [] call ace_common_fnc_isFeatureCameraActive
 *
 * Public: Yes
 */

ACE_DEPRECATED(QFUNC(isFeatureCameraActive),"3.14.0","CBA_fnc_getActiveFeatureCamera");

!(
    isNull curatorCamera && // Curator
    {!GETMVAR(EGVAR(spectator,isSet),false)} && // ACE Spectator
    {GETMVAR(EGVAR(huntir,stop),true)} && // ACE Hunt IR
    {isNull GETMVAR(BIS_EGSpectatorCamera_camera, objNull)} && // BIS Nexus Spectator
    {isNull GETUVAR(BIS_fnc_arsenal_cam, objNull)} && // Arsenal camera
    {isNull GETMVAR(BIS_fnc_establishingShot_fakeUAV, objNull)} && // Establishing shot camera
    {isNull GETMVAR(BIS_fnc_camera_cam, objNull)} && // Splendid camera
    {isNull GETUVAR(BIS_fnc_animViewer_cam, objNull)} && // Animation viewer camera
    {isNull GETMVAR(BIS_DEBUG_CAM, objNull)} // Classic camera
) // return
