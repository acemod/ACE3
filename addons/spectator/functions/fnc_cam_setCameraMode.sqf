/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to select the camera mode
 *
 * Intended to run even if new mode == old mode, as it handles focus
 *
 * Arguments:
 * 0: New camera mode <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1] call ace_spectator_fnc_cam_setCameraMode
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_newMode"];

private _oldMode = GVAR(camMode);
private _modes = GVAR(availableModes);
private _focus = GVAR(camTarget);

// If new mode isn't available then keep current (unless current also isn't)
if !(_newMode in _modes) then {
    _newMode = _modes select ((_modes find _oldMode) max 0);
};

// Can't switch camera from free mode when focus is a location
if (!(isNull _focus || GVAR(camOnLocation)) || _newMode == MODE_FREE) then {
    private _camera = GVAR(camera);
    private _showHUD = [true,true,true,true,true,true,true,true];

    if (_newMode == MODE_FPS) then {
        _camera cameraEffect ["Terminate", "BACK"];
        _focus switchCamera "INTERNAL";

        // Reset vision mode
        [VISION_NORM] call FUNC(cam_setVisionMode);

        [] call FUNC(cam_resetTarget);

        // Disable camera input
        _camera camCommand "manual off";

        // Hide all unit/group information in first person view
        _showHUD = [true,false,false,false,false,false,false,true];
    };

    if (_newMode == MODE_FOLLOW) then {
        _camera cameraEffect ["Internal", "BACK"];
        _focus switchCamera "EXTERNAL";

        [] call FUNC(cam_resetTarget);

        // Disable camera input
        _camera camCommand "manual off";
    };

    if (_newMode == MODE_FREE) then {
        _camera cameraEffect ["Internal", "BACK"];
        player switchCamera "INTERNAL";
        _camera setDir getDirVisual _camera;

        if (!isNull _focus) then {
            if (_oldMode == MODE_FPS) then {
                [_focus] call FUNC(cam_prepareTarget);
            };
            [_focus] call FUNC(cam_setTarget);
        };

        // Enable camera input
        _camera camCommand "manual on";
    };

    // Update the HUD
    cameraEffectEnableHUD true;
    showHUD _showHUD;
    GVAR(camMode) = _newMode;

    // Only update display if it exists, this function is independent of it
    if !(isNull SPEC_DISPLAY) then {
        [] call FUNC(ui_updateCamButtons);
        [] call FUNC(ui_updateHelp);
    };
};
