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
 * _array = [target, player, [params]] call ace_interaction_fnc_addPassengerAction
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_vehicle,_player,_parameters);
EXPLODE_1_PVT(_parameters,_unit);

private ["_varName", "_actionTrees", "_actions"];

_varName = format [QEGVAR(interact_menu,Act_%1), typeOf _unit];
_actionTrees = missionNamespace getVariable [_varName, []];

_actions = [];
// Mount unit MainActions menu

{
    EXPLODE_2_PVT(_x,_actionData,_children);
    _actions pushBack [_actionData, _children, _unit];
} forEach ((_actionTrees select 0) select 1);

_actions
