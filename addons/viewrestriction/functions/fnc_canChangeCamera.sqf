/*
 * Author: Jonpas
 * Checks if camera can be changed.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can Change Camera <BOOL>
 *
 * Example:
 * [] call ace_viewrestriction_fnc_canChangeCamera
 *
 * Public: No
 */
#include "script_component.hpp"

(player == ACE_player) && // Remote control hates switchCamera (control returns to player, camera is left on remotely controleld object/unit)
{!isNull ACE_player} &&
{alive ACE_player} &&
{!call EFUNC(common,isFeatureCameraActive)} &&
{!(cameraOn isKindOf "UAV" || cameraOn isKindOf "UAV_01_base_F")} // Same as first
