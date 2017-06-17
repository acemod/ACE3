/*
 * Author: GitHawk
 * Reads the fuel counter.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Truck <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, fuelTruck] call ace_refuel_fnc_readFuelCounter
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]]];

[
    REFUEL_PROGRESS_DURATION,
    [_unit, _target],
    {
        params ["_args"];
        _args params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]]];

        private _currentFuel = [_target] call FUNC(getFuel);
        if (_currentFuel == REFUEL_INFINITE_FUEL) then {
            private _fuelCounter = 0.01 * round (100 * (_target getVariable [QGVAR(fuelCounter), 0]));
            [[LSTRING(Hint_FuelCounter), _fuelCounter], 1.5, _unit] call EFUNC(common,displayTextStructured);
        } else {
            private _fuelCounter = 0.01 * round (100 * ((_target getVariable [QGVAR(fuelCounter), _currentFuel]) - _currentFuel));
            [[LSTRING(Hint_FuelCounter), _fuelCounter], 1.5, _unit] call EFUNC(common,displayTextStructured);
        };
    },
    "",
    localize LSTRING(CheckFuelCounterAction),
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
