#include "script_component.hpp"
/*
 * Author: GitHawk
 * Check if a unit can turn on a fuel nozzle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 *
 * Return Value:
 * Can turn on <BOOL>
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_canTurnOn
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]]];

if (isNull _unit  ||
    {isNull _nozzle} ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {(_nozzle distance _unit) > REFUEL_ACTION_DISTANCE}) exitWith {false};

!(_nozzle getVariable [QGVAR(isRefueling), false]) &&
    {[_nozzle getVariable QGVAR(source)] call FUNC(getFuel) != 0} &&
    {!isNull (_nozzle getVariable [QGVAR(sink), objNull])} &&
    {(fuel (_nozzle getVariable QGVAR(sink))) < 1}
