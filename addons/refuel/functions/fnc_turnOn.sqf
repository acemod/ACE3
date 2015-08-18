/*
 * Author: GitHawk
 * Turn on a fuel nozzle
 *
 * Arguments:
 * 0: The object holding the nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank] call ace_refuel_fnc_turnOn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_nozzleHolder"];

(_nozzleHolder getVariable QGVAR(nozzle)) setVariable [QGVAR(isRefueling), true, true];
