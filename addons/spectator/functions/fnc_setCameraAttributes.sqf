/*
 * Author: SilentSpike
 * Sets the spectator camera attributes as desired
 *
 * Arguments:
 * 0: Camera mode <NUMBER> <OPTIONAL>
 *   - 0: Free
 *   - 1: Internal
 *   - 2: External
 * 1: Camera unit (objNull for random) <OBJECT> <OPTIONAL>
 * 2: Camera vision <NUMBER> <OPTIONAL>
 *   - -2: Normal
 *   - -1: Night vision
 *   -  0: Thermal white hot
 *   -  1: Thermal black hot
 * 3: Camera position (ATL) <ARRAY> <OPTIONAL>
 * 4: Camera pan (0 - 360) <NUMBER> <OPTIONAL>
 * 5: Camera tilt (-90 - 90) <NUMBER> <OPTIONAL>
 * 6: Camera zoom (0.01 - 2) <NUMBER> <OPTIONAL>
 * 7: Camera speed in m/s (0.05 - 10) <NUMBER> <OPTIONAL>
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
    ["_mode",GVAR(camMode),[0]],
    ["_unit",GVAR(camUnit),[objNull]],
    ["_vision",GVAR(camVision),[0]],
    ["_position",ASLtoATL GVAR(camPos),[[]],3],
    ["_heading",GVAR(camPan),[0]],
    ["_tilt",GVAR(camTilt),[0]],
    ["_zoom",GVAR(camZoom),[0]],
    ["_speed",GVAR(camSpeed),[0]]
];

// Normalize input
if !(_mode in GVAR(availableModes)) then {
    _mode = GVAR(availableModes) select ((GVAR(availableModes) find GVAR(camMode)) max 0);
};

if !(_vision in GVAR(availableVisions)) then {
    _vision = GVAR(availableVisions) select ((GVAR(availableVisions) find GVAR(camVision)) max 0);
};

GVAR(camPan) = _heading % 360;
GVAR(camSpeed) = (_speed max 0.05) min 10;
GVAR(camTilt) = (_tilt max -89) min 89;
GVAR(camUnit) = _unit;
GVAR(camVision) = _vision;
GVAR(camZoom) = (_zoom min 2) max 0.01;

// Apply if camera exists
if (isNil QGVAR(camera)) then {
    GVAR(camMode) = _mode;
    GVAR(camPos) = (ATLtoASL _position);
} else {
    [_mode,_unit,_vision] call FUNC(transitionCamera);
    GVAR(camera) setPosATL _position;
};
