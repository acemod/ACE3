/*
 * Author: esteldunedain
 * Removes an action from a class
 *
 * Argument:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Full path of the new action <ARRAY>
 *
 * Return value:
 * None
 *
 * Example:
 * [typeOf cursorTarget, 0,["ACE_TapShoulderRight","VulcanPinch"]] call ace_interact_menu_fnc_removeActionFromClass;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_objectType", "_typeNum", "_fullPath"];

private ["_res","_varName","_actionTrees", "_parentNode", "_found"];
_res = _fullPath call FUNC(splitPath);
_res params ["_parentPath", "_actionName"];

_varName = format [[QGVAR(Act_%1), QGVAR(SelfAct_%1)] select _typeNum, _objectType];
_actionTrees = missionNamespace getVariable [_varName, []];

_parentNode = [_actionTrees, _parentPath] call FUNC(findActionNode);
if (isNil {_parentNode}) exitWith {};

// Iterate through children of the father
_found = false;
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
