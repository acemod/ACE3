/*
 * Author: Glowbal, esteldunedain
 * Loop that cleans up litter
 *
 * Arguments:
 * None
 *
 * ReturnValue:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

{
    _x params ["_time", "_objects"];
    if (CBA_missionTime - _time >= GVAR(litterCleanUpDelay)) then {
        {
            deleteVehicle _x;
        } forEach _objects;
        GVAR(allCreatedLitter) set[_forEachIndex, objNull];
    };
} forEach GVAR(allCreatedLitter);
GVAR(allCreatedLitter) = GVAR(allCreatedLitter) - [objNull];

// If no more litter remaining, exit the loop
if ( (count GVAR(allCreatedLitter)) == 0) exitWith {
    GVAR(litterPFHRunning) = false;
};

// Schedule the loop to be executed again 30 sec later
[DFUNC(litterCleanupLoop), [], 30] call CBA_fnc_waitAndExecute;
