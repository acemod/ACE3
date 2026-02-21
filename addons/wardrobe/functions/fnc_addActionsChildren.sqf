#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to create the action children, one for each possible variant of the current item.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player (not used) <OBJECT>
 * 2: Child action parameters <ARRAY>
 * - 0: Current variant <CONFIG>
 * - 1: Array of configs possible variants <ARRAY>
 *
 * Return Value:
 * Array of ace child actions <ARRAY>
 *
 * Example:
 * [player, nil, [configFile >> "CfgWeapons" >> "U_B_CTRG_1", [configFile >> "CfgWeapons" >> "U_B_CTRG_3"]]] call ace_wardrobe_fnc_addActionsChildren
 *
 * Public: No
 */

params ["_target", "", "_actionParams"];
_actionParams params ["_cfgOrigin", "_newItems"];

private _actions = [];

{
    private _cfgTarget = _x;

    // Skip missing items
    if (isNull _cfgTarget) then {
        continue;
    };

    private _aceAction = [
        configName _cfgTarget,
        [_cfgOrigin, _cfgTarget] call FUNC(getDisplayName),
        [_cfgOrigin, _cfgTarget] call FUNC(getIcon),
        FUNC(replace),
        { true },
        {},
        [_cfgOrigin, _cfgTarget]
    ] call EFUNC(interact_menu,createAction);
    _actions pushBack [_aceAction, [], _target];
} forEach _newItems;

_actions
