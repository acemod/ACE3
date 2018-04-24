/*
 * Author: PabstMirror
 * Handles clicking the delete button from the waypoint application
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_microdagr_fnc_appWaypointsButtonDeleteWP
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;
private _display = uiNamespace getVariable [[QGVAR(RscTitleDisplay), QGVAR(DialogDisplay)] select (GVAR(currentShowMode) == DISPLAY_MODE_DIALOG), displayNull];

if (isNull _display) exitWith {ERROR("No Display");};

private _wpIndex = lbCurSel (_display displayCtrl IDC_MODEWAYPOINTS_LISTOFWAYPOINTS);

//If it's our currentWP then deactivate
if (GVAR(currentWaypoint) == _wpIndex) then {GVAR(currentWaypoint) = -1};

//Delete from list:
[_wpIndex] call FUNC(deviceDeleteWaypoint);
//Update list now:
[] call FUNC(updateDisplay);
