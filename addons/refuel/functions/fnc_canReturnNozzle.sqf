#include "script_component.hpp"
/*
 * Author: GitHawk
 * Check if a unit can return a fuel nozzle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Source <OBJECT>
 *
 * Return Value:
 * Can Return Nozzle <BOOL>
 *
 * Example:
 * [player, fuelTruck] call ace_refuel_fnc_canReturnNozzle
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_source", objNull, [objNull]]];

private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];

(!isNull _nozzle) &&
{([_unit, _source] call EFUNC(interaction,getInteractionDistance)) < REFUEL_ACTION_DISTANCE} &&
{_source == (_nozzle getVariable [QGVAR(source), objNull])}
