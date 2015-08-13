/*
 * Author: esteldunedain
 * Mount unit actions inside passenger submenu
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 3: Parameters <ARRAY>
 *
 * Return value:
 * Children actions <ARRAY>
 *
 * Example:
 * [target, player, [params]] call ace_interaction_fnc_addPassengerAction
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_varName", "_actionTrees", "_actions"];
params ["_vehicle", "_player", "_parameters"];
_parameters params ["_unit"];

_varName = format [QEGVAR(interact_menu,Act_%1), typeOf _unit];
_actionTrees = missionNamespace getVariable [_varName, []];

_actions = [];
// Mount unit MainActions menu

{
    _x params ["_actionData", "_children"];
    _actions pushBack [_actionData, _children, _unit];
    true
} count ((_actionTrees select 0) select 1);

_actions
