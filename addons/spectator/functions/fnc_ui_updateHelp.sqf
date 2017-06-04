/*
 * Author: Nelson Duarte, SilentSpike
 * Updates spectator UI help element
 *
 * Note that there are some redundant conditions in this file
 * This is intentional, since controls appear via priority que
 * The overhead is minimal
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_spectator_fnc_ui_updateHelp
 *
 * Public: No
 */

#include "script_component.hpp"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#define MAX_CONTROLS_HELP_ENTRIES 12

if !(GVAR(uiHelpVisible)) exitWith {};

private _cameraMode = GVAR(camMode);
private _availableModes = GVAR(availableModes);
private _hasTarget = !isNull GVAR(camTarget);

private _controls = [];

// When not in first person, camera rotation applies
if (_cameraMode != MODE_FPS) then {
    _controls pushback ["[RMB]", localize "STR_A3_Spectator_Helper_CameraRotation"];
};

// When in free camera, focus/un-focus with LMB
if (_cameraMode == MODE_FREE) then {
    if (_hasTarget) then {
        _controls pushBack ["[LMB]", localize "STR_A3_Spectator_Helper_Unfocus"];
    } else {
        _controls pushBack ["[LMB]", localize "STR_A3_Spectator_Helper_Focus"];
    };
};

// When the camera has a focus, switch mode applies (if other modes are available)
if (_hasTarget && {!GVAR(camOnLocation)} && {count _availableModes > 1}) then {
    _controls pushBack [
        format ["[%1]", toUpper ([DIK_SPACE] call CBA_fnc_localizeKey)],
        localize "STR_A3_Spectator_Helper_CameraMode"
    ];
};

if (_cameraMode == MODE_FREE) then {
    _controls pushback [
        format ["[%1/%2]", [DIK_W] call CBA_fnc_localizeKey, [DIK_S] call CBA_fnc_localizeKey],
        localize "STR_A3_Spectator_Helper_Movement"
    ];
    _controls pushback [
        format ["[%1/%2]", [DIK_A] call CBA_fnc_localizeKey, [DIK_D] call CBA_fnc_localizeKey],
        localize "STR_A3_Spectator_Helper_Strafing"
    ];
    _controls pushback [
        format ["[%1/%2]", [DIK_Q] call CBA_fnc_localizeKey, [DIK_Z] call CBA_fnc_localizeKey],
        localize "STR_A3_Spectator_Helper_Height"
    ];
} else {
    _controls pushback [
        format ["[%1]", toUpper ([DIK_RIGHT] call CBA_fnc_localizeKey)],
        localize LSTRING(nextUnit)
    ];
    _controls pushback [
        format ["[%1]", toUpper ([DIK_LEFT] call CBA_fnc_localizeKey)],
        localize LSTRING(prevUnit)
    ];
};

if (_cameraMode != MODE_FPS) then {
    _controls pushback [
        format ["[%1]", ([DIK_N] call CBA_fnc_localizeKey)],
        localize LSTRING(nextVis)
    ];
};

_controls pushBack [
    format ["[%1]", toUpper ([DIK_BACK] call CBA_fnc_localizeKey)],
    localize "STR_A3_Spectator_Helper_Interface"
];
_controls pushBack [
    format ["[%1]", [DIK_F1] call CBA_fnc_localizeKey],
    localize "STR_A3_Spectator_Helper_Controls"
];

// Too many controls in the UI, leave these out?
// _controls pushBack [
//     format ["[%1]", [DIK_M] call CBA_fnc_localizeKey],
//     localize "str_usract_map"
// ];
// _controls pushBack [
//     format ["[%1]", [DIK_I] call CBA_fnc_localizeKey],
//     localize LSTRING(uiIcons)
// ];
// _controls pushBack [
//     format ["[%1]", [DIK_O] call CBA_fnc_localizeKey],
//     localize LSTRING(uiProjectiles)
// ];

if (_cameraMode == MODE_FREE) then {
    _controls pushBack ["[LSHIFT]", localize "STR_A3_Spectator_Helper_Shift"];
    _controls pushBack ["[LALT]", localize LSTRING(camSlow)];
};

if (count _controls > MAX_CONTROLS_HELP_ENTRIES) then {
    _controls resize MAX_CONTROLS_HELP_ENTRIES;
};

private _help = CTRL_HELP;

_help ctrlEnable false;
_help lnbSetColumnsPos [0, 0.45];
lnbClear _help;

{
    _help lnbAddRow _x;
    _help lnbSetColor [[_forEachIndex, 0], [0.75,0.6,0,1]];
} forEach _controls;

// Set height based on number of rows
private _newH = (GVAR(uiHelpH) / MAX_CONTROLS_HELP_ENTRIES) * count _controls;
private _newY = safezoneY + safezoneH - _newH;

(ctrlPosition _help) params ["_newX","","_newW"];

{
    _x ctrlSetPosition [_newX, _newY, _newW, _newH];
    _x ctrlCommit 0.15;
} forEach [CTRL_HELP_BACK, _help];
