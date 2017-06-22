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

params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]]];

private _fuel = [_target] call FUNC(getFuel);

[
    REFUEL_PROGRESS_DURATION * 2.5,
    [_unit, _target, _fuel],
    {
        params ["_args"];
        _args params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]], ["_fuel", 0, [0]]];
        if (_fuel > 0 ) then {
            [QEGVAR(common,displayTextStructured), [[LSTRING(Hint_RemainingFuel), _fuel], 2, _unit], _unit] call CBA_fnc_targetEvent;
        } else {
            [QEGVAR(common,displayTextStructured), [LSTRING(Hint_Empty), 2, _unit], _unit] call CBA_fnc_targetEvent;
        };
        true
    },
    {true},
    localize LSTRING(CheckFuelAction),
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
