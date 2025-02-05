#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Mount unit actions inside passenger submenu.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 3: Parameters <ARRAY>
 *
 * Return Value:
 * Children actions <ARRAY>
 *
 * Example:
 * array = [target, player, [params]] call ace_interaction_fnc_addPassengerActions
 *
 * Public: No
 */

params ["", "", "_parameters"];
_parameters params ["_unit"];

private _actionTrees = EGVAR(interact_menu,ActNamespace) getOrDefault [typeOf _unit, []];

private _actions = [];

// Mount unit MainActions menu
{
    _x params ["_actionData", "_children"];

    _actions pushBack [_actionData, _children, _unit];
} forEach (_actionTrees select 0 select 1);

_actions
