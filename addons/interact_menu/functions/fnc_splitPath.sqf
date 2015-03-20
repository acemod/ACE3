/*
 * Author: CAA-Picard
 * Take full path and split it between parent path and action name
 *
 * Argument:
 * Full path of the action to remove <ARRAY>
 *
 * Return value:
 * 0: Parent path <ARRAY>
 * 1: Action name <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_parentPath","_actionName"];
_parentPath = [];
for "_i" from 0 to (count _this) - 1 do {
    _parentPath pushBack (_this select _i);
};
_actionName = _this select ((count _this) - 1);

[_parentPath, _actionName]
