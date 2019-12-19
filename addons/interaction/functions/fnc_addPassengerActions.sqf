#include "script_component.hpp"
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
 * array = [target, player, [params]] call ace_interaction_fnc_addPassengerAction
 *
 * Public: No
 */

params ["", "", "_parameters"];
_parameters params ["_unit"];

private _namespace = EGVAR(interact_menu,ActNamespace);
private _actionTrees = _namespace getVariable typeOf _unit;
if (isNil "_actionTrees") then {
    _actionTrees = [];
};

private _actions = [];

// Mount unit MainActions menu
{
    _x params ["_actionData", "_children"];

    _actions pushBack [_actionData, _children, _unit];
    false
} count (_actionTrees select 0 select 1);

_actions
