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

disableSerialization;
_display = (uiNamespace getVariable ["testGPS", displayNull]);
if (isNull _display) then { _display = (uiNamespace getVariable ["testGPS_T", displayNull]);};
if (isNull _display) exitWith {};

_wpIndex = lbCurSel (_display displayCtrl IDC_MODEWAYPOINTS_LISTOFWAYPOINTS);
if ((_wpIndex < 0) || (_wpIndex > ((count GVAR(waypointList)) - 1))) exitWith {
    ERROR("out of bounds wp");
};

//If it's our currentWP then deactivate
if (GVAR(currentWaypoint) == _wpIndex) then {GVAR(currentWaypoint) = -1};

//Delete from list:
GVAR(waypointList) deleteAt _wpIndex;
//Update list now:
[] call FUNC(updateDisplay);
