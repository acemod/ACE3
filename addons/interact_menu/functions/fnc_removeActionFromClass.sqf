#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Removes an action from a class
 *
 * Arguments:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Full path of the new action <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [typeOf cursorTarget, 0,["ACE_TapShoulderRight","VulcanPinch"]] call ace_interact_menu_fnc_removeActionFromClass;
 *
 * Public: No
 */

params ["_objectType", "_typeNum", "_fullPath"];

private _res = _fullPath call FUNC(splitPath);
_res params ["_parentPath", "_actionName"];

private _namespace = [GVAR(ActNamespace), GVAR(ActSelfNamespace)] select _typeNum;
private _actionTrees = _namespace getVariable _objectType;
if (isNil "_actionTrees") then {
    _actionTrees = [];
};

private _parentNode = [_actionTrees, _parentPath] call FUNC(findActionNode);
if (isNil {_parentNode}) exitWith {};

// Iterate through children of the father
private _found = false;
{
    if (((_x select 0) select 0) == _actionName) exitWith {
        TRACE_2("Deleting Action", _forEachIndex, _x);
        _found = true;
        (_parentNode select 1) deleteAt _forEachIndex;
    };
} forEach (_parentNode select 1);

if (!_found) then {
    WARNING("Failed to find action to delete");
};
