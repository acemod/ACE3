#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Reads the fuel counter.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, fuelTruck] call ace_refuel_fnc_readFuelCounter
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_source", objNull, [objNull]]];

private _fuelCounter = _source getVariable [QGVAR(fuelCounter), 0];
_fuelCounter = 0.01 * round (100 * _fuelCounter);
[[LSTRING(Hint_FuelCounter), _fuelCounter], 1.5, _unit] call EFUNC(common,displayTextStructured);
