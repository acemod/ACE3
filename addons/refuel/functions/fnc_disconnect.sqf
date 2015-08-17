/*
 * Author: GitHawk
 * Disconnect a fuel nozzle
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The object holding the nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, truck] call ace_refuel_fnc_disconnect
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_nozzle"];
params ["_unit", "_nozzleHolder"];

_nozzle = _nozzleHolder getVariable QGVAR(nozzle);

detach _nozzle;
_nozzle setVariable [QGVAR(sink), objNull, true];
_nozzleHolder setVariable [QGVAR(nozzle), objNull, true];
_unit setVariable [QGVAR(nozzle), _nozzle];

[_unit, _nozzleHolder, _nozzle] call FUNC(takeNozzle);
