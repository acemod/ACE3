#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to create the ace action children, one for each possible variant of the current item.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Multiple input types <STRING|ARRAY|CODE>
 * - 0: Current variant <CONFIG>
 * - 1: Array of configs possible variants <ARRAY>
 *
 * Return Value:
 * Array of ace child actions <ARRAY>
 *
 * Example:
 * _this call ace_wardrobe_fnc_addActionsChildren
 *
 * Public: No
 */

params ["_target", "", "_actionParams"];
_actionParams params ["_cfgOrigin", "_newItems"];


private _actions = [];

{
    private _cfgTarget = _x;
    private _aceAction = [
        configName _cfgTarget,
        _cfgTarget call FUNC(addActionsName),
        _cfgTarget call FUNC(addActionsIcon),
        FUNC(replace),
        {true},
        {},
        [_cfgOrigin, _cfgTarget]
    ] call EFUNC(interact_menu,createAction);
    _actions pushBack [_aceAction, [], _target];

} forEach _newItems;

_actions
