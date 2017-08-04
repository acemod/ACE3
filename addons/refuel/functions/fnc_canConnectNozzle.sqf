/*
 * Author: GitHawk
 * Check if a unit can connect a fuel nozzle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can Connect Nozzle <BOOL>
 *
 * Example:
 * [player, cursorObject] call ace_refuel_fnc_canConnectNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];
private _configFuelCapacity = configFile >> "CfgVehicles" >> (typeOf _target) >> QGVAR(fuelCapacity);

!(isNull _nozzle)
&& {alive _target}
&& {!(_target isKindOf "AllVehicles" && {isEngineOn _target})}
&& {!isNumber _configFuelCapacity || {0 < getNumber _configFuelCapacity}} /* prevent connect to electric vehicle */
&& {REFUEL_ACTION_DISTANCE > ([_unit, _target] call EFUNC(interaction,getInteractionDistance))}
&& {isNull (_target getVariable [QGVAR(nozzle), objNull])}
