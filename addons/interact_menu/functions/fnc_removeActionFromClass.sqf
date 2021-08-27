#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Removes an action from a class
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
 * [typeOf cursorTarget, 0,["ACE_TapShoulderRight","VulcanPinch"]] call ace_interact_menu_fnc_removeActionFromClass;
 *
 * Public: No
 */

params ["_objectType", "_typeNum", "_fullPath", ["_inherit", false, [false]]];

private _res = _fullPath call FUNC(splitPath);
_res params ["_parentPath", "_actionName"];

if (_inherit) exitWith {
    private _children = (format ["(configName _x) isKindOf '%1'", _objectType]) configClasses (configFile >> "CfgVehicles");
    {[configName _x, _typeNum, _fullPath] call FUNC(removeActionFromClass)} forEach _children;

    private _index = GVAR(inheritedActionsAll) findIf { // find same path and actionName, and check if it's a parent class
        [_objectType isKindOf (_x select 0), _x select 2, _x select 3 select 0] isEqualTo [true, _parentPath, _actionName]
    };
    if (_index != -1) then {
        (GVAR(inheritedActionsAll) select _index select 4) pushBack _objectType; // add to exclude classes
    };
    if (_objectType isKindOf "CAManBase") then { // only children of CAManBase
        private _index = GVAR(inheritedActionsMan) findIf {[_x select 1, _x select 2 select 0] isEqualTo [_parentPath, _actionName]};
        if (_index != -1) then {
            (GVAR(inheritedActionsMan) select _index select 3) pushBack _objectType; // different index because array doesn't include _objectType
        };
    };
};

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
