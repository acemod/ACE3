/*
 * Author: GitHawk
 * Get the remaining fuel amount
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 *
 * Return Value:
 * Fuel left (in liters) <NUMBER>
 *
 * Example:
 * [unit, target] call ace_refuel_fnc_getFuel
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_fuel"];
params ["_unit", "_target"];

if (isNull _unit || {!(_unit isKindOf "CAManBase")} || {!local _unit}) exitWith {0};

_fuel = _target getVariable [QGVAR(currentFuelCargo), -2];

if (_fuel == -2) then {
    _fuel = getNumber (configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(fuelCargo));
    _target setVariable [QGVAR(currentFuelCargo), _fuel, true];
};

_fuel
