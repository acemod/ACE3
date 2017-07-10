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

params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]]];

[
    TIME_PROGRESSBAR(REFUEL_PROGRESS_DURATION),
    [_unit, _nozzle],
    {
        params ["_args"];
        _args params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]]];
        _nozzle setVariable [QGVAR(lastTickMissionTime), CBA_missionTime];
        _nozzle setVariable [QGVAR(isRefueling), true, true];
        [LSTRING(Hint_Started), 1.5, _unit] call EFUNC(common,displayTextStructured);
    },
    "",
    localize LSTRING(TurnOnAction),
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
