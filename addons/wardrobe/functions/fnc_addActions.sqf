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

params ["_unit"];

private _modifiableItems = _unit call FUNC(getItemsModifiableCurrent);
private _actions = [];

{
    private _cfg = _x#0;
    private _aceAction = [
        configName _cfg,
        getText (_cfg >> "displayName"),
        getText (_cfg >> "picture"),
        {},
        { true },
        FUNC(addActionsChildren),
        [_cfg, _x#1]
    ] call EFUNC(interact_menu,createAction);
    _actions pushBack [_aceAction, [], _unit];
} forEach _modifiableItems;

_actions
