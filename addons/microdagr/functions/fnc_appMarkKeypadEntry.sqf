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

PARAMS_1(_keypadButton);

disableSerialization;
_display = (uiNamespace getVariable ["testGPS", displayNull]);
if (isNull _display) then {
    _display = (uiNamespace getVariable ["testGPS_T", displayNull]);
};
if (isNull _display) exitWith {};

if (GVAR(currentApplicationPage) != APP_MODE_MARK) exitWith {};

_editText = ctrlText (_display displayCtrl IDC_MODEMARK_CORDSEDIT);

switch (_keypadButton) do {
case ("ok"): {
        if ((count GVAR(newWaypointPosition)) == 0) then {
            _actualPos = [9000,9000,0];
            GVAR(newWaypointPosition) = _actualPos;
            [APP_MODE_MARK] call FUNC(saveCurrentAndSetNewMode);
        } else {
            GVAR(waypointList) pushBack [_editText, GVAR(newWaypointPosition)];
            [APP_MODE_WAYPOINTS] call FUNC(saveCurrentAndSetNewMode);
        };
    };
case ("del"): {
        _editText = _editText select [0, (((count _editText) - 1) max 0)];
        (_display displayCtrl IDC_MODEMARK_CORDSEDIT) ctrlSetText _editText;
        ctrlSetFocus (_display displayCtrl IDC_MODEMARK_CORDSEDIT);
    };
    default {
        _editText = _editText + _keypadButton;
        (_display displayCtrl IDC_MODEMARK_CORDSEDIT) ctrlSetText _editText;
        ctrlSetFocus (_display displayCtrl IDC_MODEMARK_CORDSEDIT);
    };
};
