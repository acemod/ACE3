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
#include "script_component.hpp"

params ["", "", "_parameters"];
_parameters params ["_unit"];

private ["_varName", "_actionTrees", "_actions"];

_varName = format [QEGVAR(interact_menu,Act_%1), typeOf _unit];
_actionTrees = missionNamespace getVariable [_varName, []];

_actions = [];

// Mount unit MainActions menu
{
    _x params ["_actionData", "_children"];

    _actions pushBack [_actionData, _children, _unit];
    false
} count (_actionTrees select 0 select 1);

_actions
