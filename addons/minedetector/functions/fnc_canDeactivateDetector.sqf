/*
 * Author: Glowbal
 * Check if the mine detector can be deactivated
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can be deactivated <BOOL>
 *
 * Example:
 * [] call ace_minedetector_fnc_canDeactivateDetector
 *
 * Public: No
 */

#include "script_component.hpp"

([ACE_player] call FUNC(hasDetector)) &&
{[ACE_player, currentWeapon ACE_player] call FUNC(isDetectorEnabled)};
