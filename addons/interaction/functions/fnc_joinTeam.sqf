/*
 * Author: commy2
 * Assigns a unit to the team
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Team <STRING>
 *
 * Return value:
 * None
 *
 * Example:
 * [target, "YELLOW"] call ace_interaction_fnc_joinTeam
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_team);

private ["_message"];

_unit setVariable [QGVAR(assignedFireTeam), _team, true];
[_unit, format ["{_this assignTeam '%1'}", _team]] call EFUNC(common,execRemoteFnc);

if (_unit == ACE_player) then {
    _message = if (_team == "MAIN") then {
        localize "STR_ACE_Interaction_LeftTeam";
    } else {
        _team = localize format ["STR_ACE_Interaction_Team%1", _team];
        format [localize "STR_ACE_Interaction_JoinedTeam", _team];
    };

    [_message] call EFUNC(common,displayTextStructured);
};
