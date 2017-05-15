/*
 * Author: SilentSpike
 * Sets the spectator camera attributes as desired
 * All values are optional and default to whatever the current value is
 *
 * Arguments:
 * 0: Camera mode <NUMBER>
 *   - 0: Free
 *   - 1: First Person
 *   - 2: Follow
 * 1: Camera unit (objNull for random) <OBJECT>
 * 2: Camera vision <NUMBER>
 *   - -2: Normal
 *   - -1: Night vision
 *   -  0: Thermal white hot
 *   -  1: Thermal black hot
 * 3: Camera position (ATL) <ARRAY>
 * 4: Camera pan (0 - 360) <NUMBER>
 * 5: Camera tilt (-90 - 90) <NUMBER>
 * 6: Camera zoom (0.01 - 2) <NUMBER>
 * 7: Camera speed in m/s (0.05 - 10) <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [1, objNull] call ace_spectator_fnc_setCameraAttributes
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_mode",GETMVAR(GVAR(camMode),MODE_FREE),[0]],
    ["_focus",GETMVAR(GVAR(camTarget),objNull),[objNull]],
    ["_vision",GETMVAR(GVAR(camVision),VISION_NORM),[0]]
];

// Normalize input
if !(_mode in GVAR(availableModes)) then {
    _mode = GVAR(availableModes) select ((GVAR(availableModes) find GVAR(camMode)) max 0);
};

if !(_vision in GVAR(availableVisions)) then {
    _vision = GVAR(availableVisions) select ((GVAR(availableVisions) find GVAR(camVision)) max 0);
};

// Apply if camera exists
if (GVAR(isSet)) then {
    ["SetCameraMode",[_mode]] call FUNC(camera);
    ["SetVisionMode",[_vision]] call FUNC(camera);
} else {
    GVAR(camMode) = _mode;
    GVAR(camTarget) = _focus;
    GVAR(camVision) = _vision;
};
