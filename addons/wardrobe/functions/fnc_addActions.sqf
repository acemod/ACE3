#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * This function creates children for the main wardrobe action - one for every modifiable Item.
 * Each Modifiable Item will have its own children in regard of the items it can be changed towards.
 *
 * Arguments:
 * 0: The Unit who's wearable shall be changed - usually the player themselves <OBJECT>
 *
 * Return Value:
 * Array of ACE Child Actions <ARRAY>
 *
 * Example:
 * [_player] call ace_wardrobe_fnc_addActions
 *
 * Public: No
 */

params ["_unit"];


private _modifiableItems = [_unit] call FUNC(getItems_modifiable_current);
private _actions = [];
{
    private _cfg = _x#0;
    private _aceAction = [
        configName _cfg,
        getText (_cfg >> "displayName"),
        getText (_cfg >> "picture"),
        {},
        {true},
        FUNC(addActions_children),
        [_cfg, _x#1]
    ] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_aceAction, [], _target];

} forEach _modifiableItems;

_actions
