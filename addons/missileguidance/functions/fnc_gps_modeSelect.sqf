#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineCommonColors.inc"
/*
 * Author: tcvm
 * Select either TOO or PB mode. Disable anything that shouldnt be touched in TOO and renable in PB
 *
 * Arguments:
 * Mode to switch to <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call ace_missileguidance_fnc_gps_modeSelect
 *
 * Public: No
 */
params ["_mode", ["_onLoad", false]];
private _display = uiNamespace getVariable QGVAR(gpsAttackOptionDisplay);

{    
    // only TOO and PB modes modelled
    if (_mode == GPS_UI_TOO) then {
        // disable
        ctrlEnable [_x, false];
    } else {
        // enable
        ctrlEnable [_x, true];
    };
} forEach CONTROLS_DISABLED_IN_TOO;

private _backgroundColour = [
    GUI_BCG_RGB_R call BIS_fnc_parseNumber,
    GUI_BCG_RGB_G call BIS_fnc_parseNumber,
    GUI_BCG_RGB_B call BIS_fnc_parseNumber,
    GUI_BCG_ALPHA call BIS_fnc_parseNumber
];

private _selectedColour = [
    0,
    0,
    0,
    1
];

ctrlSetFocus (_display displayCtrl _mode);
if (_mode == GPS_UI_TOO) then {
    GVAR(gps_mode) = "too";
    if !(_onLoad) then {
        [GVAR(gps_pbMode)] call FUNC(gps_saveAttackSettings);
    };
} else {
    GVAR(gps_mode) = "pb";
    [GVAR(gps_pbMode)] call FUNC(gps_loadAttackSettings);
};

