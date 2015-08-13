/*
 * Author: GitHawk
 * Check if a unit can take a fuel nozzle
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 *
 * Return Value:
 * Can connect
 *
 * Example:
 * [player, target] call ace_refuel_fnc_canTakeNozzle
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_connected"];
params ["_unit", "_target"];

if (isNull _unit  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || {(_target distance _unit) > 3.5}) exitWith {false};

// Check if the fuel source is already in use
_connected = _target getVariable [QGVAR(connected), nil];
if !(isNil "_connected") exitWith {false};

// Check if the player is already carrying another fuel nozzle
_connected = _unit getVariable [QGVAR(isRefueling), nil];
if !(isNil "_connected") exitWith {false};

true