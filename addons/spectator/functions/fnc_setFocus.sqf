/*
 * Author: AACO, SilentSpike
 * Function used to set the camera focus
 *
 * Arguments:
 * 0: New focus <OBJECT>
 * 1: Focus is a location <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, false] call ace_spectator_fnc_setFocus
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_newFocus", objNull, [objNull,true]], ["_focusIsLocation",false]];

// If boolean provided then first find a focus
if (_newFocus isEqualType true) then {
    private _testFocus = ([] call FUNC(getTargetEntities)) select 0;

    if (isNil "_testFocus") then {
        if (MODE_FREE in GVAR(availableModes)) then {
            WARNING("No available entities to focus on. Switching to free cam.");
            [MODE_FREE] call FUNC(cam_setCameraMode);
            _newFocus = objNull;
        } else {
            // Default to player if necessary
            WARNING("No available entities to focus on. Using player.");
            _newFocus = player;
        };
    } else {
        _newFocus = _testFocus;
    };
};

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

    // Only update display if it exists, this function is independent of it
    if !(isNull SPEC_DISPLAY) then {
        [] call FUNC(ui_updateListFocus);
        [] call FUNC(ui_updateWidget);
        [] call FUNC(ui_updateHelp);
    };
};
