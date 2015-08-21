/*
 * Author: GitHawk
 * Get the remaining fuel amount
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Truck <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, fuelTruck] call ace_refuel_fnc_checkFuel
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_fuel"];
params ["_unit", "_target"];

_fuel = [_target] call FUNC(getFuel);

[
    5,
    [_unit, _target, _fuel],
    {
        params ["_args"];
        _args params ["_unit", "_target", "_fuel"];
        if (_fuel > 0 ) then {
            ["displayTextStructured", [_unit], [[LSTRING(Hint_RemainingFuel), _fuel], 2, _unit]] call EFUNC(common,targetEvent);
        } else {
            ["displayTextStructured", [_unit], [LSTRING(Hint_Empty), 2, _unit]] call EFUNC(common,targetEvent);
        };
        true
    },
    {true},
    localize LSTRING(CheckFuelAction),
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
