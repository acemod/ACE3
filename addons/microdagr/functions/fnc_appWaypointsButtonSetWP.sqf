#include "script_component.hpp"
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

disableSerialization;
params ["_wpButton"];

private _wpListBox = (ctrlParent _wpButton) displayCtrl 144501;
private _newWpIndex = lbCurSel _wpListBox;
private _waypoints = [] call FUNC(deviceGetWaypoints);

if ((_newWpIndex < 0) || (_newWpIndex > ((count _waypoints) - 1))) exitWith {
    GVAR(currentWaypoint) = -1;
};

GVAR(currentWaypoint) = _newWpIndex;
[APP_MODE_COMPASS] call FUNC(saveCurrentAndSetNewMode);
