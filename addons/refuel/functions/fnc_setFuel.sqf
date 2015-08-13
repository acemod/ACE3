/*
 * Author: GitHawk
 * Set the remaining fuel amount
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 * 2: The amout <NUMBER>
 *
 * Return Value:
 * Nil
 *
 * Example:
 * [unit, target] call ace_refuel_fnc_getFuel
 *
 * Public: Yes
 */
#include "script_component.hpp"
private ["_maxFuel", "_type"];
params ["_unit", "_target", "_fuel"];

if (isNull _unit || {isNull _target}  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || { (_target distance _unit) > 7}) exitWith {0};

_type = getText (configFile >> "CfgVehicles" >> typeOf _target >> "ace_refuel_type");
_maxFuel = 0;
if (_type == "mil") then {
    //_maxFuel = GVAR(mil_fuel); // FIXME
    _maxFuel = 20000; // FIXME
};
if (_type == "civ") then {
    _maxFuel = GVAR(civ_Fuel);
};
if (_type == "stationary") then {
    _maxFuel = GVAR(stationary_Fuel);
};
_target setVariable [QGVAR(fuel), _maxFuel min _fuel, true];

nil
