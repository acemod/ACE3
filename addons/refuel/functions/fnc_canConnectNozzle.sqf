/*
 * Author: GitHawk
 * Check if a unit can connect a fuel nozzle
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 *
 * Return Value:
 * Can Connect Nozzle <BOOL>
 *
 * Example:
 * [unit] call ace_refuel_fnc_canConnectNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_nozzle"];
params ["_unit"];

_nozzle = _unit getVariable QGVAR(nozzle);
if (isNil "_nozzle") exitWith {false};

true