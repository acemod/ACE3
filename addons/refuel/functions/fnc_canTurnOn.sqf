#include "script_component.hpp"
/*
 * Author: GitHawk
 * Check if a unit can turn on a fuel nozzle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 * 2: Refuel container (optional) <BOOL>
 *
 * Return Value:
 * Can turn on <BOOL>
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_canTurnOn
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]], ["_refuelContainer", false, [false]]];

if (isNull _unit  ||
    {isNull _nozzle} ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {(_nozzle distance _unit) > REFUEL_ACTION_DISTANCE}) exitWith {false};

private _source = _nozzle getVariable [QGVAR(source), objNull];
private _sink = _nozzle getVariable [QGVAR(sink), objNull];

if (isNull _source || {isNull _sink}) exitWith {false};

private _config = configOf _sink;
private _capacity = [_sink] call FUNC(getCapacity);

private _isSinkFull = if (_refuelContainer) then {
    _capacity in [REFUEL_DISABLED_FUEL, REFUEL_INFINITE_FUEL, [_sink] call FUNC(getFuel)]
} else {
    fuel _sink == 1
};

!(_nozzle getVariable [QGVAR(isRefueling), false]) &&
    {[_source] call FUNC(getFuel) != 0} &&
    {!_isSinkFull} &&
    {!(_refuelContainer && {_source == _sink})}; // No endless container ot itself loop
