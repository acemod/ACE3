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
 * ["ACE_TapShoulderRight", "VulcanPinch"] call ace_interact_menu_fnc_splitPath
 *
 * Public: No
 */

private _parentPath = [];

_parentPath append _this;

private _actionName = (_parentPath deleteAt [-1]) param [0, ""];

[_parentPath, _actionName]
