#include "script_component.hpp"
/*
 * Author: GitHawk
 * Turn on a fuel nozzle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 * 2: Refuel container (optional) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_turnOn
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]], ["_refuelContainer", false, [false]]];

private _source = _nozzle getVariable QGVAR(source);
private _sink = _nozzle getVariable QGVAR(sink);

private _config = configOf _sink;
private "_maxFuel";
if (_refuelContainer) then {
    _maxFuel = _sink getVariable [QGVAR(capacity), getNumber(_config >> QGVAR(fuelCargo))];
} else {
    _maxFuel = getNumber(_config >> QGVAR(fuelCapacity));
    // Fall back to vanilla fuelCapacity value (only air and sea vehicles don't have this defined by default by us)
    // Air and sea vehicles have that value properly defined in liters, unlike ground vehicles which is is formula of (range * tested factor) - different fuel consumption system than ground vehicles
    if (_maxFuel == 0) then {
        _maxFuel = getNumber(_config >> "fuelCapacity");
    };
};

_nozzle setVariable [QGVAR(lastTickMissionTime), CBA_missionTime];
_nozzle setVariable [QGVAR(refuelContainer), _refuelContainer];
_nozzle setVariable [QGVAR(maxFuel), _maxFuel];
_nozzle setVariable [QGVAR(isRefueling), true, true];
[LSTRING(Hint_Started), 1.5, _unit] call EFUNC(common,displayTextStructured);
[QGVAR(started), [_source, _sink]] call CBA_fnc_localEvent;