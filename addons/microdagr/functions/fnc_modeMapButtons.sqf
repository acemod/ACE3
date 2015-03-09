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

_mode = _this select 0;

[-1] call FUNC(saveCurrentAndSetNewMode); //backup current draw pos/zoom

if (_mode == "autotrack") then {
    GVAR(mapAutoTrackPosition) = !GVAR(mapAutoTrackPosition);
} else {
    if (_mode == "zoomin") then {
        GVAR(mapZoom) = GVAR(mapZoom) * (10/11);
    } else {
        GVAR(mapZoom) = GVAR(mapZoom) * (11/10);
    };
};
[] call FUNC(showApplicationPage);
