/*
 * Author: commy2, NouberNou and CAA-Picard
 * Remove an action from an object
 *
 * Argument:
 * 0: Object the action is assigned to <OBJECT>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Full path of the action to remove <ARRAY>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_object,_fullPath);

private ["_varName","_actions"];
_varName = [QGVAR(actions),QGVAR(selfActions)] select _typeNum;
_actions = _object getVariable [_varName, []];

{
    if ((_x select 8) isEqualTo _fullPath) exitWith {
        _actions deleteAt _forEachIndex;
    };
} forEach _actions;
