/*
 * Author: GitHawk
 * Check if a unit can turn off a fuel nozzle
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The object holding the nozzle <OBJECT>
 *
 * Return Value:
 * Can turn off <BOOL>
 *
 * Example:
 * [player, truck] call ace_refuel_fnc_canTurnOff
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_nozzle", "_fueling"];
params ["_unit", "_nozzleHolder"];

if (isNull _unit  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || {(_nozzleHolder distance _unit) > REFUEL_ACTION_DISTANCE}) exitWith {false};

!(isNull (_nozzleHolder getVariable [QGVAR(nozzle), objNull])) && {(_nozzleHolder getVariable QGVAR(nozzle)) getVariable [QGVAR(fueling), 0] != 0}
