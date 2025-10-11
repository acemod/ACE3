#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * This function creates children for the main wardrobe action - one for every modifiable item.
 * Each modifiable item will have its own children in regard of the items it can be changed towards.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * ACE actions <ARRAY>
 *
 * Example:
 * player call ace_wardrobe_fnc_addActions
 *
 * Public: No
 */

params ["_player"];

private _actions = [];

// Create a "in progress" placeholder until a previous wardrobe action is not done
private _aceAction = [
    QGVAR(inProgress),
    LLSTRING(action_inProgress),
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\wait_ca.paa",
    {},
    { GVAR(inProgress) },
    { }
] call EFUNC(interact_menu,createAction);
_actions pushBack [_aceAction, [], _player];

// Actions for wardrobe items
private _modifiableItems = [_player] call FUNC(getAvailableItemVariants);
{
    _x params ["_cfg", "_newItems"];

    private _aceAction = [
        configName _cfg,
        getText (_cfg >> "displayName"),
        getText (_cfg >> "picture"),
        {},
        { ! GVAR(inProgress) },
        FUNC(addActionsChildren),
        [_cfg, _newItems]
    ] call EFUNC(interact_menu,createAction);

    _actions pushBack [_aceAction, [], _player];
} forEach _modifiableItems;

_actions
