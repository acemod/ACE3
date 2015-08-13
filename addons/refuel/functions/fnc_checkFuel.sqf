/*
 * Author: GitHawk
 * Get the remaining fuel amount
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 *
 * Return Value:
 * nil
 *
 * Example:
 * [unit, target] call ace_refuel_fnc_checkFuel
 *
 * Public: Yes
 */
#include "script_component.hpp"
private ["_fuel", "_type"];
params ["_unit", "_target"];

if (isNull _unit  || {!(_unit isKindOf "CAManBase")} || {!local _unit} || { (_target distance _unit) > 7}) exitWith {0};

_fuel = [_unit, _target] call FUNC(getFuel);

[
    5,
    [_unit, _target, _fuel],
    {
        params ["_args"];
        EXPLODE_3_PVT(_args,_unit,_target,_fuel);
        if (_fuel > 0 ) then {
            ["displayTextStructured", [_unit], [[LSTRING(Hint_RemainingFuel), _fuel], 2, _unit]] call EFUNC(common,targetEvent);
        } else {
            ["displayTextStructured", [_unit], [LSTRING(Hint_Empty), 2, _unit]] call EFUNC(common,targetEvent);
        };
        true
    },
    {true},
    localize LSTRING(CheckFuel),
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);

