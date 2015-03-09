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
_wpButton = _this select 0;
_wpListBox = (ctrlParent _wpButton) displayCtrl 144501;
_newWpIndex = lbCurSel _wpListBox;
if ((_newWpIndex < 0) || (_newWpIndex > ((count GVAR(waypointList)) - 1))) exitWith {
    GVAR(currentWaypoint) = -1;
    ERROR("out of bounds wp");
};

GVAR(currentWaypoint) = _newWpIndex;
[APP_MODE_COMPASS] call FUNC(saveCurrentAndSetNewMode);
