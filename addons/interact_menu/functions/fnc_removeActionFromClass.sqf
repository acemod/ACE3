#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Removes an action from a class.
 *
 * Arguments:
 * 0: TypeOf of the class <STRING>
 * 1: Type of action, 0 for actions, 1 for self-actions <NUMBER>
 * 2: Full path of the new action <ARRAY>
 * 3: Remove action from child classes <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [typeOf cursorTarget, 0, ["ACE_TapShoulderRight", "VulcanPinch"]] call ace_interact_menu_fnc_removeActionFromClass;
 *
 * Public: No
 */

params ["_objectType", "_typeNum", "_fullPath", ["_useInheritance", false, [false]]];

_objectType = _objectType call EFUNC(common,getConfigName);

private _res = _fullPath call FUNC(splitPath);
_res params ["_parentPath", "_actionName"];

if (_useInheritance) exitWith {
    // Only need to run for classes that have already been initialized
    {
        [_x, _typeNum, _fullPath] call FUNC(removeActionFromClass);
    } forEach (GVAR(inheritedClassesAll) select {_x isKindOf _objectType});

    // Find same path and actionName, and check if it's a parent class, needs to be checked for all classes
    private _index = GVAR(inheritedActionsAll) findIf {
        _x params ["_currentType", "", "_currentParentPath", "_currentAction"];

        [_objectType isKindOf _currentType, _currentParentPath, _currentAction select 0] isEqualTo [true, _parentPath, _actionName]
    };

     // Add to exclude classes
    if (_index != -1) then {
        (GVAR(inheritedActionsAll) select _index select 4) pushBackUnique _objectType;
    };

    // Children of CAManBase need special treatment because of inheritedActionsMan array
    if (_objectType isKindOf "CAManBase") then {
        private _index = GVAR(inheritedActionsMan) findIf {
            _x params ["", "_currentParentPath", "_currentAction"];

            [_currentParentPath, _currentAction select 0] isEqualTo [_parentPath, _actionName]
        };

        // Different index because array doesn't include _objectType
        if (_index != -1) then {
            (GVAR(inheritedActionsMan) select _index select 3) pushBackUnique _objectType;
        };
    };
};

private _namespace = [GVAR(ActNamespace), GVAR(ActSelfNamespace)] select _typeNum;
private _actionTrees = _namespace getOrDefault [_objectType, []];

private _parentNode = [_actionTrees, _parentPath] call FUNC(findActionNode);
if (isNil "_parentNode") exitWith {};

// Iterate through children of the father
private _found = false;
{
    if (((_x select 0) select 0) == _actionName) exitWith {
        TRACE_2("Deleting Action",_forEachIndex,_x);
        _found = true;
        (_parentNode select 1) deleteAt _forEachIndex;
    };
} forEach (_parentNode select 1);

if (!_found) then {
    WARNING("Failed to find action to delete");
};
