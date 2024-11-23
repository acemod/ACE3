#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Gets the squad child actions
 *
 * Arguments:
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Children actions <ARRAY>
 *
 * Example:
 * [player, player] call ace_interaction_fnc_addSquadChildren
 *
 * Public: No
 */

params ["", "_player"];

private _fnc_color = {
    (switch (toUpper _this) do {
        case "RED": {missionNamespace getVariable [QEGVAR(nametags,nametagColorRed), [221, 0, 0]]};
        case "GREEN": {missionNamespace getVariable [QEGVAR(nametags,nametagColorGreen), [0, 221, 0]]};
        case "BLUE": {missionNamespace getVariable [QEGVAR(nametags,nametagColorBlue), [0, 0, 221]]};
        case "YELLOW": {missionNamespace getVariable [QEGVAR(nametags,nametagColorYellow), [221, 221, 0]]};
        default {missionNamespace getVariable [QEGVAR(nametags,nametagColorMain), [255, 255, 255]]};
    }) call BIS_fnc_colorRGBtoHTML
};

private _units = (units group _player) - [_player];

private _subActions = [];
_subActions pushBack (["drop", localize "str_a3_endgame_notifications_title_drop", "\a3\ui_f\data\igui\cfg\actions\ico_off_ca.paa",
    {[_target] joinSilent grpNull}, {true}] call EFUNC(interact_menu,createAction));

{
    private _icon = [QPATHTOF(UI\team\team_white_ca.paa), _x call _fnc_color];
    private _name = localize format ["str_assign_%1", _x];
    _subActions pushBack ([_x, _name, _icon,
        {[_target, _this#2] call FUNC(joinTeam)}, {assignedTeam _target != _this#2}, {}, _x] call EFUNC(interact_menu,createAction));
} forEach ["RED", "GREEN", "BLUE", "YELLOW", "MAIN"];

private _actions = _units apply {
    private _unit = _x;
    private _icon = [QPATHTOF(UI\team\team_white_ca.paa), (assignedTeam _unit) call _fnc_color];
    private _actionUnit = [hashValue _x, [_x, true] call EFUNC(common,getName), _icon, {}, {true}] call EFUNC(interact_menu,createAction);

    [_actionUnit, _subActions apply { [_x, [], _unit] }, _unit]
};

_actions
