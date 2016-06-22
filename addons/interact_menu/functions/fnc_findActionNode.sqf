/*
 * Author: esteldunedain
 * Return action point from path
 * Note: This function is NOT global.
 *
 * Arguments:
 * 0: List of Action Tree <ARRAY>
 * 1: Path <ARRAY>
 *
 * Return Value:
 * Action node <ARRAY> or <NIL> if not found 
 *
 * Example:
 * [actionTree, ["ACE_TapShoulderRight","VulcanPinchAction"]] call ace_interact_menu_fnc_findActionNode;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_actionTreeList", "_parentPath"];

// Hack to make this work on the root node too
if (_parentPath isEqualTo []) exitWith {
    [[],_actionTreeList]
};

// Search the class action trees and find where to insert the entry
private _parentNode = [[],_actionTreeList];
private _foundParentNode = false;

private _fnc_findFolder = {
    params ["_parentPath", "_level", "_actionNode"];

    {
        _x params ["_actionData", "_actionChildren"];
        if ((_actionData select 0) isEqualTo (_parentPath select _level)) exitWith {

            if (count _parentPath == _level + 1) exitWith {
                _parentNode = _x;
                _foundParentNode = true;
            };

            // The action should go somewhere in here
            [_parentPath, _level + 1, _x] call _fnc_findFolder;
        };
    } forEach (_actionNode select 1);
};

[_parentPath, 0, [[],_actionTreeList]] call _fnc_findFolder;

// Exit if there's no entry point to insert this action
if (!_foundParentNode) exitWith {};

_parentNode
