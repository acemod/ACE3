/*
 * Author: GitHawk
 * Check if a unit can refuel
 *
 * Arguments:
 * 0: The target <OBJECT>
 *
 * Return Value:
 * Can refuel <BOOL>
 *
 * Example:
 * [unit, target] call ace_refuel_fnc_canRefuel
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_fuel"];
params ["_unit", "_target"];

if (isNull _unit  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || { (_target distance _unit) > 7}) exitWith {false};

_fuel = [_unit, _target] call FUNC(getFuel);
if (_fuel > 0 || {_fuel == -1}) exitWith {true};

false