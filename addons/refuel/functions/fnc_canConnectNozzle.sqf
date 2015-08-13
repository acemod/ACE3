/*
 * Author: GitHawk
 * Check if a unit can connect a fuel nozzle
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 *
 * Return Value:
 * NIL
 *
 * Example:
 * [unit, target, nozzle] call ace_refuel_fnc_connectNozzle
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_nozzle"];
params ["_unit", "_target"];

_nozzle = _unit getVariable [QGVAR(nozzle), nil];
if (isNil "_nozzle") exitWith {false};

true