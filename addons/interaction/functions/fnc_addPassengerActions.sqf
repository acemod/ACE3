/*
 * Author: esteldunedain
 * Mount unit actions inside passenger submenu
 *
 * Argument:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 * 3: Parameters <ARRAY>
 *
 * Return value:
 * Children actions <ARRAY>
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_vehicle,_player,_parameters);

private ["_unit","_actions"];
_unit = _parameters select 0;

_varName = format [QEGVAR(interact_menu,Act_%1), typeOf _unit];
_actionTrees = missionNamespace getVariable [_varName, []];

_actions = [];
// Mount unit MainActions menu

{
    EXPLODE_2_PVT(_x,_actionData,_children);
    _actions pushBack [_actionData, _children, _unit];
} forEach ((_actionTrees select 0) select 1);

_actions
