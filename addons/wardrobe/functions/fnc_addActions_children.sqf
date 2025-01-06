#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to create the ace action children, one for each possible variant of the current item.
 *
 * Arguments:
 * 0: target <OBJECT>
 * 1: player <OBJECT>
 * 2: Multiple input types <STRING|ARRAY|CODE>
 * - 0: Current Variant <Config>
 * - 1: Array of Configs Possible Variants <ARRAY>
 *
 * Return Value:
 * Array of ACE Child Actions <ARRAY>
 *
 * Example:
 * _this call ace_wardrobe_fnc_addActions_children
 *
 * Public: No
 */

params ["_target", "_player", "_actionParams"];
_actionParams params ["_cfg_origin", "_newItems"];


private _actions = [];

{
    private _cfg_target = _x;
    private _aceAction = [
        configName _cfg_target,
        [_cfg_target] call FUNC(getAction_Name),
        [_cfg_target] call FUNC(getAction_Icon),
        FUNC(replace),
        {true},
        {},
        [_cfg_origin, _cfg_target]
    ] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_aceAction, [], _target];

} forEach _newItems;

_actions
