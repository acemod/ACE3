/*
 * Author: GitHawk
 * Check if a unit can return a fuel nozzle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can Return Nozzle <BOOL>
 *
 * Example:
 * [unit, tank] call ace_refuel_fnc_canReturnNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_nozzle"];
params ["_unit", "_target"];

_nozzle = _unit getVariable QGVAR(nozzle);

(_this call FUNC(canConnectNozzle)) && {_target == (_nozzle getVariable [QGVAR(source), objNull])}
