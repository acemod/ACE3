/*
 * Author: GitHawk
 * Set the remaining fuel amount.
 *
 * Arguments:
 * 0: Fuel Source <OBJECT>
 * 1: Amount (in liters)<NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [fuelTruck, 42] call ace_refuel_fnc_setFuel
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_source", objNull, [objNull]], ["_fuel", nil, [0]]];

if (isNull _source ||
    {isNil "_fuel"}) exitWith {};

_source setVariable [QGVAR(currentFuelCargo), _fuel, true];
