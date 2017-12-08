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

["CBA_teamColorChanged", [_unit, _team]] call CBA_fnc_globalEvent;

// display message
if (_unit == ACE_player) then {
    private _message = "";

    if (_team == "MAIN") then {
        _message = localize LSTRING(LeftTeam);
    } else {
        _team = localize format [LSTRING(Team%1), _team];
        _message = format [localize LSTRING(JoinedTeam), _team];
    };

    [_message] call EFUNC(common,displayTextStructured);
};
