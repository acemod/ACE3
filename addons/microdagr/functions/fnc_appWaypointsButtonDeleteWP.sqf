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
_display = displayNull;
if (GVAR(currentShowMode) == DISPLAY_MODE_DIALOG) then {
    _display = (uiNamespace getVariable [QGVAR(DialogDisplay), displayNull]);
} else {
    _display = (uiNamespace getVariable [QGVAR(RscTitleDisplay), displayNull]);
};
if (isNull _display) exitWith {ERROR("No Display");};

_wpIndex = lbCurSel (_display displayCtrl IDC_MODEWAYPOINTS_LISTOFWAYPOINTS);

//If it's our currentWP then deactivate
if (GVAR(currentWaypoint) == _wpIndex) then {GVAR(currentWaypoint) = -1};

//Delete from list:
[_wpIndex] call FUNC(deviceDeleteWaypoint);
//Update list now:
[] call FUNC(updateDisplay);
