/*
 * Author: commy2
 * Unit joins a fire team.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Team <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "YELLOW"] call ace_interaction_fnc_joinTeam
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_team"];

// make sure correct team is set on JIP
_unit setVariable [QGVAR(assignedFireTeam), _team, true];

// join fire team on every machine in that group
["assignTeam", units group _unit, [_unit, _team]] call EFUNC(common,targetEvent);

// display message
if (_unit == ACE_player) then {
	private "_message";

    if (_team == "MAIN") then {
        _message = localize LSTRING(LeftTeam);
    } else {
        _team = localize format [LSTRING(Team%1), _team];
        _message = format [localize LSTRING(JoinedTeam), _team];
    };

    ["displayTextStructured", _message] call EFUNC(common,localEvent);
};
