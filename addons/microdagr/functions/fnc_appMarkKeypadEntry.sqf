#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles the keypad entries from the "Mark" Application
 *
 * Arguments:
 * 0: String version of Keypad entry ["ok","del","1",...] <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ok"] call ace_microdagr_fnc_appMarkKeypadEntry
 *
 * Public: No
 */

params ["_keypadButton"];

disableSerialization;
private _display = uiNamespace getVariable [[QGVAR(RscTitleDisplay), QGVAR(DialogDisplay)] select (GVAR(currentShowMode) == DISPLAY_MODE_DIALOG), displayNull];

if (isNull _display) exitWith {ERROR("No Display");};

if (GVAR(currentApplicationPage) != APP_MODE_MARK) exitWith {};

private _editText = ctrlText (_display displayCtrl IDC_MODEMARK_CORDSEDIT);

switch (_keypadButton) do {
case ("ok"): {
        if ((count GVAR(newWaypointPosition)) == 0) then {
            private _actualPos = [_editText, true] call EFUNC(common,getMapPosFromGrid);
            _actualPos set [2, (getTerrainHeightASL _actualPos)];
            GVAR(newWaypointPosition) = _actualPos;
            [APP_MODE_MARK] call FUNC(saveCurrentAndSetNewMode);
        } else {
            [_editText, GVAR(newWaypointPosition)] call FUNC(deviceAddWaypoint);
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
