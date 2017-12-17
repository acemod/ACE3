/*
 * Author: commy2, NouberNou and esteldunedain
 * Removes an action from an object
 *
 * Arguments:
 * 0: Object the action is assigned to <OBJECT>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Full path of the action to remove <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget,0,["ACE_TapShoulderRight","VulcanPinch"]] call ace_interact_menu_fnc_removeActionFromObject;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object", "_typeNum", "_fullPath"];

private _res = _fullPath call FUNC(splitPath);
_res params ["_parentPath", "_actionName"];

private _varName = [QGVAR(actions),QGVAR(selfActions)] select _typeNum;
private _actionList = _object getVariable [_varName, []];
{
    if (((_x select 0) select 0) isEqualTo _actionName &&
        {(_x select 1) isEqualTo _parentPath}) exitWith {
        _actionList deleteAt _forEachIndex;
    };
} forEach _actionList;
