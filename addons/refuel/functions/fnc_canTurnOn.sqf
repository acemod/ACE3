/*
 * Author: GitHawk
 * Check if a unit can turn on a fuel nozzle
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The object holding the nozzle <OBJECT>
 *
 * Return Value:
 * Can turn on <BOOL>
 *
 * Example:
 * [player, truck] call ace_refuel_fnc_canTurnOn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_nozzleHolder"];

if (isNull _unit  ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {(_nozzleHolder distance _unit) > REFUEL_ACTION_DISTANCE}) exitWith {false};

private "_nozzle";

_nozzle = _nozzleHolder getVariable [QGVAR(nozzle), objNull];
(!isNull _nozzle) &&
    {!(_nozzle getVariable [QGVAR(isRefueling), false])} &&
    {[_nozzle getVariable QGVAR(source)] call FUNC(getFuel) != 0}
