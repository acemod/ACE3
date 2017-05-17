/*
 * Author: Nelson Duarte, AACO
 * Function used to handle map mouse clicks
 *
 * Public: No
 */

#include "script_component.hpp"
TRACE_1("Params",_this);
disableSerialization;

params ["", "", "_x", "_y"];

if (isNull GVAR(uiMapHighlighted)) then {
    // Give user feedback that camera is no longer focused
    if !(isNull GVAR(camTarget)) then {
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
