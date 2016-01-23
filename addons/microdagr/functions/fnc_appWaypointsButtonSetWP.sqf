/*
 * Author: PabstMirror
 * Handles clicking the setWP button from the waypoint application
 *
 * Arguments:
 * The "SetWP" button <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1234] call ace_microdagr_fnc_appWaypointsButtonSetWP
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_wpListBox", "_newWpIndex", "_waypoints"];

disableSerialization;
params ["_wpButton"];

_wpListBox = (ctrlParent _wpButton) displayCtrl 144501;
_newWpIndex = lbCurSel _wpListBox;
_waypoints = [] call FUNC(deviceGetWaypoints);

if ((_newWpIndex < 0) || (_newWpIndex > ((count _waypoints) - 1))) exitWith {
    GVAR(currentWaypoint) = -1;
};

GVAR(currentWaypoint) = _newWpIndex;
[APP_MODE_COMPASS] call FUNC(saveCurrentAndSetNewMode);
