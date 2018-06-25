#include "script_component.hpp"
/*
 * Author: Nelson Duarte, AACO
 * Function used to handle map mouse click events
 *
 * Arguments:
 * 0: Map control <CONTROL>
 * 1: Mouse button pressed <NUMBER>
 * 2: x screen coordinate clicked <BOOL>
 * 3: y screen coordinate clicked <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_ui_handleMapClick
 *
 * Public: No
 */

params ["", "", "_x", "_y"];

if (isNull GVAR(uiMapHighlighted)) then {
    // Give user feedback that camera is no longer focused
    if !(isNull GVAR(camFocus)) then {
        playSound "ReadoutHideClick1";
    };

    // Preserve camera height on teleport
    private _pos = CTRL_MAP ctrlMapScreenToWorld [_x, _y];
    _pos set [2, (getPosASLVisual GVAR(camera)) select 2];

    GVAR(camera) setPosASL _pos;
} else {
    // Give user feedback that camera is focused on highlighted unit
    playSound "ReadoutClick";
};

[GVAR(uiMapHighlighted)] call FUNC(setFocus);
