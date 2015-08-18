/*
 * Author: GitHawk, Jonpas
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

private ["_nozzle", "_dummy"];
params ["_unit", "_target"];

_nozzle = _unit getVariable QGVAR(nozzle);
_source = _nozzle getVariable QGVAR(source);

if (isNil "_nozzle" || {_source != _target}) exitWith {false};

_unit setVariable [QGVAR(nozzle), nil];
detach _nozzle;
[_unit, QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);
REFUEL_UNHOLSTER_WEAPON

_unit setVariable [QGVAR(isRefueling), false];
_target setVariable [QGVAR(isConnected), false, true];
ropeDestroy (_nozzle getVariable QGVAR(rope));
deleteVehicle _nozzle;

true
