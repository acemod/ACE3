#include "..\script_component.hpp"
/*
 * Author: commy2
 * Unit joins a fire team.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Team <STRING>
 * 2: Display hint <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "YELLOW", false] call ace_interaction_fnc_joinTeam
 *
 * Public: No
 */

params ["_unit", "_team", ["_displayHint", false]];

_unit assignTeam _team;

// Display message
if (_displayHint && {_unit == ACE_player}) then {
    private _team = localize format ["str_team_%1", _team];
    private _message = format [LLSTRING(JoinedTeam), _team];
    [_message] call EFUNC(common,displayTextStructured);
};
