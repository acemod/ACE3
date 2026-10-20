#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Checks if a unit can turn off a fuel nozzle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 *
 * Return Value:
 * Can turn off <BOOL>
 *
 * Example:
 * [player, cursorObject] call ace_refuel_fnc_canTurnOff
 *
 * Public: No
 */

params ["_unit", "_nozzle"];

alive _unit &&
{alive _nozzle} &&
{_unit isKindOf "CAManBase"} &&
{_nozzle getVariable [QGVAR(isRefueling), false]}
