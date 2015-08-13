/*
 * Author: GitHawk
 * Check if a unit can turn off a fuel nozzle
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The object holding the nozzle <OBJECT>
 *
 * Return Value:
 * Can turn off
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_canTurnOff
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_nozzleHolder"];

if (isNull _unit  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || { (_nozzleHolder distance _unit) > REFUEL_ACTION_DISTANCE}) exitWith {false};

_nozzle = _nozzleHolder getVariable QGVAR(nozzle);
_nozzle setVariable [QGVAR(fueling), 0];

true