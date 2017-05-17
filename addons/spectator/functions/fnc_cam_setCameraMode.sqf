/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to select the camera mode
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_newMode"];

private _oldMode = GVAR(camMode);
private _modes = GVAR(availableModes);

// If new mode isn't available then keep current (unless current also isn't)
if !(_newMode in _modes) then {
    _newMode = _modes select ((_modes find _oldMode) max 0);
};

// Should run even if the mode is the same, as it handles focus
// if (_newMode == _oldMode) exitWith {};

private _focus = GVAR(camTarget);
if (!isNull _focus || _newMode == MODE_FREE) then {
    private _camera = GVAR(camera);

    if (_newMode == MODE_FPS) exitWith {
        _camera cameraEffect ["Terminate", "BACK"];
        _focus switchCamera "INTERNAL";

        // Reset vision mode
        // [VISION_NORM] call FUNC(cam_setVisionMode);

        [] call FUNC(cam_resetTarget);

        // Disable camera input
        _camera camCommand "manual off";

        // Update UI
        CTRL_FPS ctrlSetText CAM_ICON_FIRST_SELECTED;
        CTRL_FOLLOW ctrlSetText CAM_ICON_THIRD;
        CTRL_FREE ctrlSetText CAM_ICON_FREE;

        // Update HUD
        showHUD [true, false, false, false, false, false, false, true];
        cameraEffectEnableHUD true;
        GVAR(camMode) = _newMode;
    };

    if (_newMode == MODE_FOLLOW) exitWith {
        _camera cameraEffect ["Internal", "BACK"];
        _focus switchCamera "EXTERNAL";

        [] call FUNC(cam_resetTarget);

        // Disable camera input
        _camera camCommand "manual off";

        // Update UI
        CTRL_FPS ctrlSetText CAM_ICON_FIRST;
        CTRL_FOLLOW ctrlSetText CAM_ICON_THIRD_SELECTED;
        CTRL_FREE ctrlSetText CAM_ICON_FREE;

        // Update HUD
        showHUD [true, true, true, true, true, true, true, true];
        cameraEffectEnableHUD true;
        GVAR(camMode) = _newMode;
    };

    if (_newMode == MODE_FREE) exitWith {
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

        // Update UI
        CTRL_FPS ctrlSetText CAM_ICON_FIRST;
        CTRL_FOLLOW ctrlSetText CAM_ICON_THIRD;
        CTRL_FREE ctrlSetText CAM_ICON_FREE_SELECTED;

        // Update HUD
        showHUD [true, true, true, true, true, true, true, true];
        cameraEffectEnableHUD true;
        GVAR(camMode) = _newMode;
    };
};
