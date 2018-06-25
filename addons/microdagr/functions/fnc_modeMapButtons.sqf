#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Takes some arguments and returns something or other.
 *
 * Arguments:
 * 0: String of the map button pressed <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["autotrack"] call ace_microdagr_fnc_modeMapButtons
 *
 * Public: No
 */

params ["_mode"];

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
