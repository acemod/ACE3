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
private _isContainer = !(isNil {_sink getVariable QGVAR(currentFuelCargo)})
                       || {isNumber (configFile >> "CfgVehicles" >> typeOf _sink >> QGVAR(fuelCargo))};

private _isFull = if (_refuelContainer) then {
    private _currentFuel = [_sink] call FUNC(getFuel);
    private _capacity = _sink getVariable [
        QGVAR(capacity),
        getNumber (configFile >> "CfgVehicles" >> typeOf _sink >> QGVAR(fuelCargo))
    ];

    (_currentFuel == REFUEL_INFINITE_FUEL) || {_capacity == REFUEL_INFINITE_FUEL} || {_currentFuel == _capacity}
} else {
    fuel _sink == 1
};

!(_nozzle getVariable [QGVAR(isRefueling), false]) &&
    {[_source] call FUNC(getFuel) != 0} &&
    {!isNull _sink} &&
    {!_isFull} &&
    {!(_refuelContainer && {_source == _sink})} && // No endless container ot itself loop
    {!_refuelContainer || _isContainer} // Container refueling only if it actually is one
