#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Calculate cooldown of all the stored spare barrels.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_overheating_fnc_updateSpareBarrelsTemperaturesThread
 *
 * Public: No
 */

TRACE_1("updateSpareBarrelsTemperaturesThread1",GVAR(storedSpareBarrels));
{
    _y params ["_initialTemp","_initialTime", "_barrelMass"];

    // Calculate cooling
    private _finalTemp = [_initialTemp, _barrelMass, CBA_missionTime - _initialTime] call FUNC(calculateCooling);
    TRACE_4("updateSpareBarrelsTemperaturesThread2",_barrelMagazineID,_initialTemp,_finalTemp,_barrelMass);
    if (_finalTemp < 5) then {
        // The barrel is cool enough to keep calculating. Remove it from the hash
        GVAR(storedSpareBarrels) deleteAt _x;
    } else {
        // Store the new temp
        GVAR(storedSpareBarrels) set [_x, [_finalTemp, CBA_missionTime, _barrelMass]];
    };
} forEach GVAR(storedSpareBarrels);

// Schedule for execution again after 10 seconds
[DFUNC(updateSpareBarrelsTemperaturesThread), [], 10] call CBA_fnc_waitAndExecute;
