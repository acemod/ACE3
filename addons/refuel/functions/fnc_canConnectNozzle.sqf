/*
 * Author: GitHawk
 * Check if a unit can connect a fuel nozzle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can Connect Nozzle <BOOL>
 *
 * Example:
 * [player, tank] call ace_refuel_fnc_canConnectNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_nozzle"];
params ["_unit", "_target"];

_nozzle = _unit getVariable QGVAR(nozzle);

!(isNil "_nozzle" ||
    {(_target distance _unit) > REFUEL_ACTION_DISTANCE} ||
    {!isNull (_target getVariable [QGVAR(nozzle), objNull])}) // TODO verify cant connect multiple fuel lines
