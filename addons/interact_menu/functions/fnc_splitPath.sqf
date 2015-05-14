/*
 * Author: esteldunedain
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

private ["_parentPath","_actionName", "_i"];
_parentPath = [];
for [{_i = 0},{_i < (count _this) - 1},{_i = _i + 1}] do {
    _parentPath pushBack (_this select _i);
};
_actionName = if (count _this > 0) then {
    _this select ((count _this) - 1);
} else {
    ""
};

[_parentPath, _actionName]
