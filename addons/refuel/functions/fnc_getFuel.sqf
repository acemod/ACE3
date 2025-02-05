#include "..\script_component.hpp"
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
    // Calling getCapacity will initialize the fuel source and return the amount of fuel in the tank
    _fuel = [_source] call FUNC(getCapacity);
};

_fuel
