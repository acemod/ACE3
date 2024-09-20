#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Take full path and split it between parent path and action name
 *
 * Arguments:
 * Full path of the action to remove <ARRAY>
 *
 * Return Value:
 * 0: Parent path <ARRAY>
 * 1: Action name <STRING>
 *
 * Example:
 * [[path]] call ACE_interact_menu_fnc_splitPath
 *
 * Public: No
 */

private _parentPath = [];

_parentPath append _this;

private _count = count _this;

private _actionName = if (_count > 0) then {
    _parentPath deleteAt (_count - 1) // TODO: replace with _parentPath deleteAt [-1] and drop _count in 2.18
} else {
    ""
};

[_parentPath, _actionName]
