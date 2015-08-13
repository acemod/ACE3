/*
 * Author: GitHawk
 * Get the remaining fuel amount
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 *
 * Return Value:
 * Number of liters left
 *
 * Example:
 * [unit, target] call ace_refuel_fnc_getFuel
 *
 * Public: Yes
 */
#include "script_component.hpp"
private ["_fuel", "_type"];
params ["_unit", "_target"];

if (isNull _unit  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || { (_target distance _unit) > 7}) exitWith {0};

_fuel = _target getVariable [QGVAR(fuel), -2];
if (_fuel == -2) then {
    _type = getText (configFile >> "CfgVehicles" >> typeOf _target >> "ace_refuel_type");
    if (_type == "mil") then {
        //_fuel = GVAR(mil_fuel); // FIXME
        _fuel = 20000; // FIXME
        _target setVariable [QGVAR(fuel), _fuel, true];
    } else {
        if (_type == "civ") then {
            _fuel = GVAR(civ_fuel);
            _target setVariable [QGVAR(fuel), _fuel, true];
        } else {
            if (_type == "stationary") then {
                _fuel = GVAR(stationary_fuel);
                _target setVariable [QGVAR(fuel), _fuel, true];
            } else {
                _fuel = 0;
            };
        };
    };
};

_fuel
