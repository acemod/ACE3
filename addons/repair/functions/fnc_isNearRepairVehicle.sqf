/*
 * Author: KoffeinFlummi
 * Checks if a unit is in a engineeral vehicle.
 *
 * Arguments:
 * 0: unit to be checked <OBJECT>
 *
 * Return Value:
 * Is unit in engineeral vehicle? <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit"];
TRACE_1("params",_unit);

private ["_nearObjects", "_return"];

_nearObjects = nearestObjects [_unit, ["Air","LandVehicle"], 20];

_return = false;
{
    if ([_x] call FUNC(isRepairVehicle)) exitwith {_return = true;};
} forEach _nearObjects;

_return;
