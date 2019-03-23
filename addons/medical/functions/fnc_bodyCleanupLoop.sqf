#include "script_component.hpp"
/*
 * Author: Glowbal, esteldunedain
 * Loop that cleans up litter
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_medical_fnc_bodyCleanupLoop
 *
 * Public: No
 */

{
    TRACE_2("body",_x,isPlayer _x);
    if ((!isNull _x) && {!isPlayer _x}) then {deleteVehicle _x};
} forEach GVAR(bodiesToDelete);

// deleteVehicle doesn't have instant results so it won't usualy be filtered until next run
GVAR(bodiesToDelete) = GVAR(bodiesToDelete) - [objNull];

// If no more bodies remain, exit the loop
if (GVAR(bodiesToDelete) isEqualTo []) exitWith {
    TRACE_1("array emptied - rem PFEH",GVAR(bodiesToDelete));
};

// Schedule the loop to be executed again 20 sec later
[DFUNC(bodyCleanupLoop), [], 20] call CBA_fnc_waitAndExecute;
