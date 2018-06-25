#include "script_component.hpp"
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

if (call FUNC(canActivateDetector)) then {
    [ACE_player, currentWeapon ACE_player] call FUNC(enableDetector);
};
