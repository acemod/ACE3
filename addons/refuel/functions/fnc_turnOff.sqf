/*
 * Author: GitHawk
 * Turn off a fuel nozzle
 *
 * Arguments:
 * 0: The object holding the nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_turnOff
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_nozzleHolder"];

(_nozzleHolder getVariable QGVAR(nozzle)) setVariable [QGVAR(isRefueling), false, true];
