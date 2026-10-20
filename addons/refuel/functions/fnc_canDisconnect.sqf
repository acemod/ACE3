#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Checks if a unit can disconnect a fuel nozzle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 *
 * Return Value:
 * Can disconnect <BOOL>
 *
 * Example:
 * [player, cursorObject] call ace_refuel_fnc_canDisconnect
 *
 * Public: No
 */

params ["_unit", "_nozzle"];

!isNull _unit &&
{_unit isKindOf "CAManBase"} &&
{!isNull _nozzle} &&
{isNull (_unit getVariable [QGVAR(nozzle), objNull])} && // unit already has another nozzle
{(_nozzle distance _unit) <= REFUEL_ACTION_DISTANCE} &&
{!isNull (_nozzle getVariable [QGVAR(sink), objNull])} && // already disconnected
{!(_nozzle getVariable [QGVAR(isRefueling), false])} // return
