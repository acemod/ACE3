#include "script_component.hpp"
/*
 * Author: Glowbal, esteldunedain, mharis001
 * Handles cleaning up litter objects that have reached the end of their lifetime.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_treatment_fnc_litterCleanupLoop
 *
 * Public: No
 */

{
    _x params ["_object", "_timeCreated"];

    // Litter array has older objects at the beginning
    // Can exit on first element that still has lifetime remaining
    if (CBA_missionTime - _timeCreated < GVAR(litterCleanupDelay)) exitWith {};

    deleteVehicle _object;
    GVAR(litterObjects) set [_forEachIndex, objNull];
} forEach GVAR(litterObjects);

GVAR(litterObjects) = GVAR(litterObjects) - [objNull];

// Exit the loop if no litter objects left
if (GVAR(litterObjects) isEqualTo []) exitWith {
    GVAR(litterCleanup) = false;
};

// Schedule cleanup loop to executed again
[FUNC(litterCleanupLoop), [], LITTER_CLEANUP_CHECK_DELAY] call CBA_fnc_waitAndExecute;
