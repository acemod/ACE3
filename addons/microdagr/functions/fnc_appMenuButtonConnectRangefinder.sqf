/*
 * Author: PabstMirror
 * Takes some arguments and returns something or other.
 *
 * Arguments:
 * 0: The first argument <STRING>
 * 1: The second argument <OBJECT>
 * 2: Third Optional Argument <BOOL><OPTIONAL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * _bool = ["something", player] call ace_common_fnc_imanexample
 *
 * Public: Yes
 */
#include "script_component.hpp"

GVAR(currentWaypoint) = if (GVAR(currentWaypoint) == -2) then {-1} else {-2};
GVAR(rangeFinderPositionASL) = [];
[APP_MODE_INFODISPLAY] call FUNC(saveCurrentAndSetNewMode);
