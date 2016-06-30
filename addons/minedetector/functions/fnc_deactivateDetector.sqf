/*
 * Author: Glowbal
 * Deactivate the mine detector
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_minedetector_fnc_deactivateDetector
 *
 * Public: No
 */

#include "script_component.hpp"

if (call FUNC(canDeactivateDetector)) then {
    [ACE_player, currentWeapon ACE_player] call FUNC(disableDetector);
};
