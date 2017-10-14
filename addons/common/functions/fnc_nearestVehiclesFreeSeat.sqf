/*
 * Author: 654wak654
 * Returns a list of vehicles near given unit that the unit can be a passenger in.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Distance <NUMBER>
 *
 * Return Value:
 * Nearest vehicles with a free seat <ARRAY>
 *
 * Example:
 * [bob] call ace_common_fnc_nearestVehiclesFreeSeat
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", ["_distance", 10]];

private _nearVehicles = nearestObjects [_unit, ["Car", "Air", "Tank", "Ship_F", "Pod_Heli_Transport_04_crewed_base_F"], _distance];
_nearVehicles select {(_x emptyPositions "cargo" > 0) || {_x emptyPositions "gunner" > 0}}
