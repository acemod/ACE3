#include "script_component.hpp"
/*
 * Author: Glowbal, esteldunedain
 * Handles cleaning up bodies that were replaced by body bags.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_treatment_fnc_bodyCleanupLoop
 *
 * Public: No
 */

{
    TRACE_2("Handling body cleanup",_x,isPlayer _x);
    if (!isNull _x && {!isPlayer _x}) then {deleteVehicle _x};
} forEach GVAR(bodiesToDelete);

// deleteVehicle doesn't have instant results so it won't usualy be filtered until next run
GVAR(bodiesToDelete) = GVAR(bodiesToDelete) - [objNull];

// Exit the loop if no more bodies remain
if (GVAR(bodiesToDelete) isEqualTo []) exitWith {
    TRACE_1("Ending body cleanup loop",GVAR(bodiesToDelete));
};

// Schedule cleanup loop to executed again
[FUNC(bodyCleanupLoop), [], BODY_CLEANUP_CHECK_DELAY] call CBA_fnc_waitAndExecute;
