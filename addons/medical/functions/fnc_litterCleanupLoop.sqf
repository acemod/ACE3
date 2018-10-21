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
 * call ACE_medical_fnc_litterCleanupLoop
 *
 * Public: No
 */

{
    _x params ["_time", "_objects"];
    //Older elements are always at the begining of the array:
    if ((CBA_missionTime - _time) < GVAR(litterCleanUpDelay)) exitWith {};
    TRACE_2("deleting",_time,_objects);
    {
        deleteVehicle _x;
    } forEach _objects;
    GVAR(allCreatedLitter) set [_forEachIndex, objNull];
} forEach GVAR(allCreatedLitter);
GVAR(allCreatedLitter) = GVAR(allCreatedLitter) - [objNull];

// If no more litter remaining, exit the loop
if (GVAR(allCreatedLitter) isEqualTo []) exitWith {
    GVAR(litterPFHRunning) = false;
};

// Schedule the loop to be executed again 30 sec later
[DFUNC(litterCleanupLoop), [], 30] call CBA_fnc_waitAndExecute;
