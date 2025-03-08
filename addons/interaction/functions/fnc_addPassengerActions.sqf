#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Mount unit actions inside passenger submenu.
 *
 * Arguments:
 * 0: Vehicle (not used) <OBJECT>
 * 1: Player (not used) <OBJECT>
 * 2: Parameters <ARRAY>
 *
 * Return Value:
 * Children actions <ARRAY>
 *
 * Example:
 * [cursorObject, player, [crew cursorObject select 0]] call ace_interaction_fnc_addPassengerActions
 *
 * Public: No
 */

params ["", "", "_parameters"];
_parameters params ["_unit"];

private _actionTrees = EGVAR(interact_menu,ActNamespace) get typeOf _unit;

// Mount unit MainActions menu
(_actionTrees select 0 select 1) apply {
    _x params ["_actionData", "_children"];

    [_actionData, _children, _unit]
} // return
