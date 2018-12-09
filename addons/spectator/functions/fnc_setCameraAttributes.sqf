#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Sets the spectator camera attributes as desired. Local effect.
 * All values are optional and default to no change.
 *
 * Arguments:
 * 0: Camera mode <NUMBER>
 *   - 0: Free
 *   - 1: First Person
 *   - 2: Follow
 * 1: Camera focus <OBJECT or BOOL>
 * 2: Camera vision <NUMBER>
 *   - -2: Normal
 *   - -1: Night vision
 *   -  0: Thermal white hot
 *   -  1: Thermal black hot
 *   - ...
 * 3: Camera position (ATL) <ARRAY>
 * 4: Camera direction (0 - 360) <NUMBER>
 *
 * Notes:
 * - If camera mode is not free and camera has no focus, random will be used
 * - To remove any current camera focus in free cam, use objNull
 * - To select a random camera focus, use a boolean
 *
 * Return Value:
 * None
 *
 * Example:
 * [1, objNull] call ace_spectator_fnc_setCameraAttributes
 *
 * Public: Yes
 */

params [
    ["_mode",nil,[0]],
    ["_focus",nil,[objNull,true]],
    ["_vision",nil,[0]],
    ["_position",nil,[[]],3],
    ["_direction",nil,[0]]
];

// Apply if camera exists
if !(isNil QGVAR(camera)) then {
    // These functions are smart and handle unavailable inputs
    if !(isNil "_focus") then {
        [_focus] call FUNC(setFocus);
    };

    if !(isNil "_mode") then {
        // If mode not free and no focus, find focus
        if ((_mode != MODE_FREE) && {isNull GVAR(camFocus)}) then {
            [true] call FUNC(setFocus);
        };

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
        // If there are no entities this becomes nil, handled on camera startup
        if (_focus isEqualType true) then {
            _focus = ([] call FUNC(getTargetEntities)) select 0;
        };

        GVAR(camFocus) = _focus;
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
