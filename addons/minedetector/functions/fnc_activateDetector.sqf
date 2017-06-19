/*
 * Author: Glowbal
 * Activate the mine detector
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_minedetector_fnc_activateDetector
 *
 * Public: No
 */

#include "script_component.hpp"

if (call FUNC(canActivateDetector)) then {
    [ACE_player, currentWeapon ACE_player] call FUNC(enableDetector);
};
