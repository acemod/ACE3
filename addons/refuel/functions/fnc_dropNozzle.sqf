/*
 * Author: GitHawk
 * Detaches the fuel nozzle, drops it and removes player variables.
 *
 * Arguments:
 * 0: Unit <OBJECT> (optional)
 * 1: Nozzle <OBJECT>
 * 2: Disconnect Only <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player,  nozzle, false] call ace_refuel_fnc_dropNozzle
 * [objNull, nozzle, false] call ace_refuel_fnc_dropNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_nozzle", ["_disconnectOnly", false]];

detach _nozzle;
_nozzle setVariable [QGVAR(isRefueling), false, true];

if (_disconnectOnly) exitWith {};
_nozzle setVelocity [0, 0, 0];
_nozzle setPosATL [(getPosATL _nozzle) select 0, (getPosATL _nozzle) select 1, 0.05];

if (isNull _unit) exitWith {};
_unit setVariable [QGVAR(isRefueling), false, true];
_unit setVariable [QGVAR(nozzle), objNull, true];
