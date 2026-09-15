#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Display Initialization (only for the local player)
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display, "abc"] call ace_milr_fnc_display_init
 *
 * Public: No
 */
params ["_display"];
if (isNull _display) exitWith { ERROR("MILR display is null"); };

uiNamespace setVariable [QGVAR(display), _display];

private _ctrlBackground = _display ctrlCreate ["RscPicture", -1];
_ctrlBackground ctrlSetText "#(argb,8,8,3)color(0.05,0.05,0.05,1)";
_ctrlBackground ctrlSetPosition [0,0,1,1];
_ctrlBackground ctrlCommit 0;

// private _ctrlBackground = _display ctrlCreate ["RscPicture", -1]; // rough safezone
// _ctrlBackground ctrlSetText "#(argb,8,8,3)color(0.22352941,0.101960786,1,1)";
// _ctrlBackground ctrlSetPosition [0.02,0.02,.95,.42];
// _ctrlBackground ctrlCommit 0;

private _ctrlRange = _display ctrlCreate [QGVAR(structuredText), IDC_MILR_RANGE];
_ctrlRange ctrlSetPosition [0,0.025,0.95,0.3];
_ctrlRange ctrlCommit 0;

private _ctrlElev = _display ctrlCreate [QGVAR(structuredText), IDC_MILR_ELEV];
_ctrlElev ctrlSetPosition [0.05,0.3,0.35,0.12];
_ctrlElev ctrlSetBackgroundColor [0.9,0.9,0.9,1];
_ctrlElev ctrlCommit 0;

call FUNC(display_refresh);
