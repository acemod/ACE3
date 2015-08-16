/*
 * Author: GitHawk et.al., Jonpas
 * Returns the nozzle back to source vehicle.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Returned Nozzle <BOOL>
 *
 * Example:
 * [player] call ace_refuel_fnc_returnNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_nozzle"];

params ["_unit", "_target"];

_source = _nozzle getVariable QGVAR(source);
_nozzle = _unit getVariable QGVAR(nozzle);

if (_source != _target || {isNil "_nozzle"}) exitWith {false};

_source setVariable [QGVAR(isConnected), false, true];
ropeDestroy (_nozzle getVariable QGVAR(rope));
deleteVehicle _nozzle;
_unit setVariable [QGVAR(isRefueling), false];

true
