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

private _fuel = _source getVariable QGVAR(currentFuelCargo);

if (isNil "_fuel") then {
    _fuel = getNumber (configFile >> "CfgVehicles" >> typeOf _source >> QGVAR(fuelCargo));
    _source setVariable [QGVAR(currentFuelCargo), _fuel, true];
};

_fuel
