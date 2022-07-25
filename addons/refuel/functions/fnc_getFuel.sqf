#include "script_component.hpp"
/*
 * Author: GitHawk, Jonpas
 * Get the remaining fuel amount.
 *
 * Arguments:
 * 0: Fuel Source <OBJECT>
 *
 * Return Value:
 * Fuel left (in liters) <NUMBER>
 *
 * Example:
 * [fuelTruck] call ace_refuel_fnc_getFuel
 *
 * Public: Yes
 */

params [["_source", objNull, [objNull]]];

if (isNull _source) exitWith {0};

_source getVariable [QGVAR(currentFuelCargo), 0];