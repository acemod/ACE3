#include "script_component.hpp"
/*
 * Author: Jonpas
 * Checks if camera can be changed.
 *
 * Arguments:
 * 0: New Camera View <STRING>
 * 1: Vehicle <OBJECT>
 * 2: Check gunner view <BOOL> (default: true)
 *
 * Return Value:
 * Can Change Camera <BOOL>
 *
 * Example:
 * ["INTERNAL", vehicle] call ace_viewrestriction_fnc_canChangeCamera
 *
 * Public: No
 */

params ["_newCameraView", "_cameraOn", ["_checkGunnerView", true]];

// Remote control hates switchCamera (control returns to player, camera is left on remotely controlled object/unit), make sure remote controlled units are not impacted

!(_newCameraView isEqualTo "GUNNER" && {_checkGunnerView}) &&
{!(_newCameraView isEqualTo "GROUP")} &&
{!isNull ACE_player} &&
{player == ACE_player} &&
{alive ACE_player} &&
{ACE_player == _cameraOn || vehicle ACE_player == _cameraOn} &&
{"" isEqualTo call CBA_fnc_getActiveFeatureCamera} &&
{!(_cameraOn isKindOf "UAV" || _cameraOn isKindOf "UAV_01_base_F")} // UAVs are remote controlled
