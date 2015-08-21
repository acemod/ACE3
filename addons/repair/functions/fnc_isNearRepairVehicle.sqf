/*
 * Author: KoffeinFlummi
 * Checks if a unit is near an engineering vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is near engineering vehicle <BOOL>
 *
 * Example:
 * [unit] call ace_repair_fnc_isNearRepairVehicle
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
