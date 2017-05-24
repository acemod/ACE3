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
    {!alive _target} ||
    {_engine} ||
    {([_unit, _target] call EFUNC(interaction,getInteractionDistance)) > REFUEL_ACTION_DISTANCE} ||
    {!isNull (_target getVariable [QGVAR(nozzle), objNull])})
