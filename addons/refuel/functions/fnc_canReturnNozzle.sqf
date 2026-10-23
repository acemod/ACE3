#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Checks if a unit can return a fuel nozzle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Source <OBJECT>
 *
 * Return Value:
 * Can Return Nozzle <BOOL>
 *
 * Example:
 * [player, cursorObject] call ace_refuel_fnc_canReturnNozzle
 *
 * Public: No
 */

params ["_unit", "_source"];

private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];

(!isNull _nozzle) &&
{_source == (_nozzle getVariable [QGVAR(source), objNull])} // return
