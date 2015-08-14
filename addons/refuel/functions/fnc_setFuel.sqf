/*
 * Author: GitHawk
 * Set the remaining fuel amount
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 * 2: The amout <NUMBER>
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

if (isNull _unit || {isNull _target}  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || { (_target distance _unit) > 7}) exitWith {0};

_target setVariable [QGVAR(currentFuelCargo), (getNumber (configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(fuelCargo))) min _fuel, true];
