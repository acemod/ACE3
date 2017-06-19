/*
 * Author: GitHawk
 * Set the remaining fuel amount.
 *
 * Arguments:
 * 0: Fuel Truck <OBJECT>
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

params [["_target", objNull, [objNull]], ["_fuel", nil, [0]]];

if (isNull _target ||
    {isNil "_fuel"}) exitWith {};

_target setVariable [QGVAR(currentFuelCargo), _fuel, true];
