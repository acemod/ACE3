/*
 * Author: GitHawk
 * Turn on a fuel nozzle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_turnOn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_nozzle"];

[
    2,
    [_unit, _nozzle],
    {
        private "_source";
        params ["_args"];
        _args params ["_unit", "_nozzle"];
        _nozzle setVariable [QGVAR(isRefueling), true, true];
        [LSTRING(Hint_Started), 1.5, _unit] call EFUNC(common,displayTextStructured);

        _source = _nozzle getVariable QGVAR(source);
        _source setVariable [QGVAR(fuelCounter), [_source] call FUNC(getFuel)];
    },
    "",
    localize LSTRING(TurnOnAction),
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
