/*
 * Author: GitHawk
 * Check if a unit can disconnect a fuel nozzle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 *
 * Return Value:
 * Can disconnect <BOOL>
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_canDisconnect
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_sink"];
params ["_unit", "_nozzle"];

if (isNull _unit ||
    {isNull _nozzle} ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {(_nozzle distance _unit) > REFUEL_ACTION_DISTANCE}) exitWith {false};

_sink = _nozzle getVariable [QGVAR(sink), objNull];
!((isNull _sink) || {_nozzle getVariable [QGVAR(isRefueling), false]})
