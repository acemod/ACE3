/*
 * Author: AACO, SilentSpike
 * Function used to set the camera focus
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_newFocus", objNull, [objNull]], ["_focusIsLocation",false]];

if (_newFocus != GVAR(camTarget) && { !(isNull _newFocus && { isNull GVAR(camTarget) }) }) then {
    GVAR(camTarget) = _newFocus;

    if (isNull _newFocus) then {
        if (GVAR(camMode) == MODE_FREE) then {
            [] call FUNC(cam_resetTarget);
        } else {
            [MODE_FREE] call FUNC(cam_setCameraMode);
        };
    } else {
        // Locations can only be focused on in free camera
        if (_focusIsLocation) then {
            [MODE_FREE] call FUNC(cam_setCameraMode);
        } else {
            [GVAR(camMode)] call FUNC(cam_setCameraMode);
        };
    };

    // GVAR used to prevent camera switching and UI info on locations
    GVAR(camOnLocation) = _focusIsLocation;

    // Only update display if it exists, this function is called from some other places
    if !(isNull SPEC_DISPLAY) then {
        [] call FUNC(ui_updateListFocus);
        [] call FUNC(ui_updateWidget);
        [] call FUNC(ui_updateHelp);
    };
};
