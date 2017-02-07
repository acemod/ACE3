/*
 * Author: Glowbal
 * Check if the mine detector can be activated
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can be activated <BOOL>
 *
 * Example:
 * [] call ace_minedetector_fnc_canActivateDetector
 *
 * Public: No
 */

#include "script_component.hpp"

([ACE_player] call FUNC(hasDetector)) &&
!([ACE_player, currentWeapon ACE_player] call FUNC(isDetectorEnabled));
