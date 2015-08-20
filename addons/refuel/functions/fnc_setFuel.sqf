/*
 * Author: GitHawk
 * Set the remaining fuel amount.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 * 2: Amount (in liters)<NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, target] call ace_refuel_fnc_getFuel
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_maxFuel"];
params ["_unit", "_target", "_fuel"];

if (isNull _unit ||
    {isNull _target}  ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {(_target distance _unit) > 7}) exitWith {};

_target setVariable [QGVAR(currentFuelCargo), (getNumber (configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(fuelCargo))) min _fuel, true];
