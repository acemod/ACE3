/*
 * Author: GitHawk
 * Disconnect a fuel nozzle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_disconnect
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_sink"];
params ["_unit", "_nozzle"];

_sink = _nozzle getVariable [QGVAR(sink), objNull];
if (isNull _sink) exitWith {};

_sink setVariable [QGVAR(nozzle), objNull, true];
_nozzle setVariable [QGVAR(sink), objNull, true];
_nozzle setVariable [QGVAR(isConnected), false, true];
[objNull, _nozzle, true] call FUNC(dropNozzle);

[_unit, objNull, _nozzle] call FUNC(takeNozzle);
