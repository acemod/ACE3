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
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

private _pairs = [];
TRACE_1("updateSpareBarrelsTemperaturesThread1",GVAR(storedSpareBarrels));
[GVAR(storedSpareBarrels), {
    //IGNORE_PRIVATE_WARNING ["_key", "_value"];
    _pairs pushBack [_key, _value];
}] call CBA_fnc_hashEachPair;
TRACE_1("updateSpareBarrelsTemperaturesThread2",_pairs);
{
    _x params ["_barrelMagazineID","_value"];
    _value params ["_initialTemp","_initialTime", "_barrelMass"];

    // Calculate cooling
    private _finalTemp = [_initialTemp, _barrelMass, CBA_missionTime - _initialTime] call FUNC(calculateCooling);
    TRACE_4("updateSpareBarrelsTemperaturesThread3",_barrelMagazineID,_initialTemp,_finalTemp,_barrelMass);
    if (_finalTemp < 5) then {
        // The barrel is cool enough to keep calculating. Remove it from the hash
        [GVAR(storedSpareBarrels), _barrelMagazineID] call CBA_fnc_hashRem;
    } else {
        // Store the new temp
        [GVAR(storedSpareBarrels), _barrelMagazineID, [_finalTemp, CBA_missionTime, _barrelMass]] call CBA_fnc_hashSet;
    };
} forEach _pairs;

// Schedule for execution again after 10 seconds
[DFUNC(updateSpareBarrelsTemperaturesThread), [], 10] call CBA_fnc_waitAndExecute;
