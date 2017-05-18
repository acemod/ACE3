/*
 * Author: AACO, SilentSpike
 * Function used to set the camera focus
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_newFocus", objNull, [objNull]]];

if (_newFocus != GVAR(camTarget) && { !(isNull _newFocus && { isNull GVAR(camTarget) }) }) then {
    GVAR(camTarget) = _newFocus;

    if (isNull _newFocus) then {
        if (GVAR(camMode) == MODE_FREE) then {
            [] call FUNC(cam_resetTarget);
        } else {
            [MODE_FREE] call FUNC(cam_setCameraMode);
        };
    } else {
        [GVAR(camMode)] call FUNC(cam_setCameraMode);
    };

    [] call FUNC(ui_updateListFocus);
    [] call FUNC(ui_updateWidget);
    [] call FUNC(ui_updateHelp);
};
