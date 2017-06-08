/*
 * Author: GitHawk
 * Check if a unit can rearm a vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Pick Up Ammo <BOOL>
 *
 * Example:
 * [tank, player] call ace_rearm_fnc_canRearmVehicle
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_vehicle", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
];

!(isNull _unit ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {(_vehicle distance _unit) > REARM_ACTION_DISTANCE} ||
    {!isNull (_unit getVariable [QGVAR(dummy), objNull])} ||
    {GVAR(level) > 0})
