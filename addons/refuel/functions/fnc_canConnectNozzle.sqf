/*
 * Author: GitHawk
 * Check if a unit can connect a fuel nozzle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can Connect Nozzle <BOOL>
 *
 * Example:
 * [player, tank] call ace_refuel_fnc_canConnectNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]]];

private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];
private _engine = false;

if (_target isKindOf "AllVehicles") then {
    _engine = isEngineOn _target;
};

!(isNull _nozzle ||
    {_engine} ||
    {(_target distance _unit) > REFUEL_ACTION_DISTANCE} ||
    {!isNull (_target getVariable [QGVAR(nozzle), objNull])}) // TODO verify cant connect multiple fuel lines
