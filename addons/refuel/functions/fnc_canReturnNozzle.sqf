/*
 * Author: GitHawk
 * Check if a unit can return a fuel nozzle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel truck <OBJECT>
 *
 * Return Value:
 * Can Return Nozzle <BOOL>
 *
 * Example:
 * [player, fuelTruck] call ace_refuel_fnc_canReturnNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]]];

private _nozzle = _unit getVariable QGVAR(nozzle);

(_this call FUNC(canConnectNozzle)) && {_target == (_nozzle getVariable [QGVAR(source), objNull])}
