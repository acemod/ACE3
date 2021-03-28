#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Used to update the docked camera buttons
 * Disables unavailable, highlights current
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_spectator_fnc_ui_updateCamButtons
 *
 * Public: No
 */

// These correspond to the camera mode indices
#define ENUM_IDCs [IDC_FREE, IDC_FPS, IDC_FOLLOW]
#define ENUM_ACTIVE [CAM_ICON_FREE_SELECTED, CAM_ICON_FPS_SELECTED, CAM_ICON_FOLLOW_SELECTED]
#define ENUM_INACTIVE [CAM_ICON_FREE, CAM_ICON_FPS, CAM_ICON_FOLLOW]

private _current = ENUM_IDCs select GVAR(camMode);

{
    if (_forEachIndex in GVAR(availableModes)) then {
        // Highlight the current camera mode button
        private _icon = ([ENUM_INACTIVE, ENUM_ACTIVE] select (_x == _current)) select _forEachIndex;

        (CTRL_CAM_TYPES controlsGroupCtrl _x) ctrlSetText _icon;
        (CTRL_CAM_TYPES controlsGroupCtrl _x) ctrlShow true;
    } else {
        // Disable any inactive camera modes
        (CTRL_CAM_TYPES controlsGroupCtrl _x) ctrlShow false;
    };
} forEach ENUM_IDCs;
