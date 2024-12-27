#include "..\script_component.hpp"
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
    private _finalTemp = [_initialTemp, _barrelMass, CBA_missionTime - _initialTime, 0] call FUNC(calculateCooling); //the zero is to indicate an open bolt gun. Barrel is outside of a gun here, so always open.
    TRACE_4("updateSpareBarrelsTemperaturesThread2",_x,_initialTemp,_finalTemp,_barrelMass);
    if (_finalTemp <= (ambientTemperature select 0)) then {
        // The barrel is cool enough to finish calculating. Remove it from the hash
        GVAR(storedSpareBarrels) deleteAt _x;
    } else {
        // Store the new temp
        GVAR(storedSpareBarrels) set [_x, [_finalTemp, CBA_missionTime, _barrelMass]];
    };
} forEach GVAR(storedSpareBarrels);

// Schedule for execution again after 10 seconds
[DFUNC(updateSpareBarrelsTemperaturesThread), [], 10] call CBA_fnc_waitAndExecute;
