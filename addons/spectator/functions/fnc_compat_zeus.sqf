#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Handles compatibility with curator interface (i.e. re-opens spectator if applicable)
 *
 * Called from the RscDisplayCurator XEH
 *
 * Arguments:
 * 0: RscDisplayCurator <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_compat_zeus
 *
 * Public: No
 */

params ["_display"];

_display displayAddEventHandler ["Unload",{
    // Only re-open if still a spectator (and not remote-controlling)
    if (GVAR(isSet) && {isNull (GETMVAR(bis_fnc_moduleRemoteControl_unit,objNull))}) then {
        // Display must be opened next frame to prevent game crash
        [{
            // Reset the camera and vision modes
            [GVAR(camMode)] call FUNC(cam_setCameraMode);
            [GVAR(camVision)] call FUNC(cam_setVisionMode);
            [true] call FUNC(ui);
        }] call CBA_fnc_execNextFrame;
    };
}];
