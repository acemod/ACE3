/*
 * Author: SilentSpike
 * Sets the spectator camera attributes as desired
 * All values are optional and default to no change
 *
 * Arguments:
 * 0: Camera mode <NUMBER>
 *   - 0: Free
 *   - 1: First Person
 *   - 2: Follow
 * 1: Camera focus (objNull for random) <OBJECT>
 * 2: Camera vision <NUMBER>
 *   - -2: Normal
 *   - -1: Night vision
 *   -  0: Thermal white hot
 *   -  1: Thermal black hot
 * 3: Camera position (ATL) <ARRAY>
 * 4: Camera direction (0 - 360) <NUMBER>
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
    ["_mode",nil,[0]],
    ["_focus",nil,[objNull]],
    ["_vision",nil,[0]],
    ["_position",nil,[[]],3],
    ["_direction",nil,[0]]
];

// ACE_DEPRECATED (< Tag so that this is found via a search, can remove the warning in future)
if (count _this > 5) then {
    WARNING("Use of ""tilt"", ""zoom"" and ""speed"" camera attributes is no longer supported");
};

// For null focus or unit camera mode with no focus, select randomly
if (!isNil "_mode" || (!isNil "_focus" && {isNull _focus})) then {
    if ((isNil "_mode" || {_mode != MODE_FREE}) && (isNil "_focus" || {isNull _focus})) then {
        _focus = selectRandom ([] call FUNC(getTargetEntities));
    };
};

// Apply if camera exists
if (GVAR(isSet)) then {
    // These functions are smart and handle unavailable inputs
    if !(isNil "_focus") then {
        [_focus] call FUNC(setFocus);
    };

    if !(isNil "_mode") then {
        [_mode] call FUNC(cam_setCameraMode);
    };

    if !(isNil "_vision") then {
        [_vision] call FUNC(cam_setVisionMode);
    };

    if !(isNil "_position") then {
        GVAR(camera) setPosATL _position;
    };

    if !(isNil "_direction") then {
        GVAR(camera) setDir _direction;
    };
} else {
    if !(isNil "_focus") then {
        GVAR(camTarget) = _focus;
    };

    if !(isNil "_mode") then {
        GVAR(camMode) = _mode;
    };

    if !(isNil "_vision") then {
        GVAR(camVision) = _vision;
    };

    // GVARs exits purely for pre-setting of these attributes
    if !(isNil "_position") then {
        GVAR(camPos) = ATLtoASL _position;
    };

    if !(isNil "_direction") then {
        GVAR(camDir) = _direction;
    };
};
