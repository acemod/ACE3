/*
 * Author: commy2
 * Assigns a unit to the team
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Team <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [target, "YELLOW"] call ace_interaction_fnc_joinTeam
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_message"];
params ["_unit", "_team"];

_unit setVariable [QGVAR(assignedFireTeam), _team, true];
[_unit, format ["{_this assignTeam '%1'}", _team]] call EFUNC(common,execRemoteFnc);

if (_unit == ACE_player) then {
    _message = if (_team == "MAIN") then {
        localize LSTRING(LeftTeam);
    } else {
        _team = localize format [LSTRING(Team%1), _team];
        format [localize LSTRING(JoinedTeam), _team];
    };

    [_message] call EFUNC(common,displayTextStructured);
};
