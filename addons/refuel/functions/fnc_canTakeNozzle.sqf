/*
 * Author: GitHawk
 * Check if a unit can take a fuel nozzle
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 *
 * Return Value:
 * Can connect <BOOL>
 *
 * Example:
 * [player, target] call ace_refuel_fnc_canTakeNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

if (isNull _unit ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {!alive _target} ||
    {(_target distance _unit) > REFUEL_ACTION_DISTANCE}) exitWith {false};

!(_target getVariable [QGVAR(isConnected), false]) && {!(_unit getVariable [QGVAR(isRefueling), false])}
