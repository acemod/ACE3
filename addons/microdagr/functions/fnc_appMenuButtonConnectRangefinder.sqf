/*
 * Author: PabstMirror
 * Handles the "Connect To" button from the menu application
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call ace_microdagr_fnc_appMenuButtonConnectRangefinder
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(currentWaypoint) = if (GVAR(currentWaypoint) == -2) then {-1} else {-2};
GVAR(rangeFinderPositionASL) = [];
[APP_MODE_INFODISPLAY] call FUNC(saveCurrentAndSetNewMode);
