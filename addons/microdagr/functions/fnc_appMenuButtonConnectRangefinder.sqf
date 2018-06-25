#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles the "Connect To" button from the menu application
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_microdagr_fnc_appMenuButtonConnectRangefinder
 *
 * Public: No
 */

GVAR(currentWaypoint) = [-2, -1] select (GVAR(currentWaypoint) == -2);
GVAR(rangeFinderPositionASL) = [];
[APP_MODE_INFODISPLAY] call FUNC(saveCurrentAndSetNewMode);
