/*
 * Author: F3 Project, Head, SilentSpike
 * Processes the change in mouse position for the spectator camera
 *
 * Arguments:
 * 0: Mouse x coord <NUMBER>
 * 1: Mouse y coord <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [0.5, 0.5] call ace_spectator_fnc_handleMouse;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_x","_y"];
private ["_leftButton","_rightButton","_oldX","_oldY","_deltaX","_deltaY","_zoomMod"];

_leftButton = GVAR(mouse) select 0;
_rightButton = GVAR(mouse) select 1;

_oldX = GVAR(mousePos) select 0;
_oldY = GVAR(mousePos) select 1;

// Get change in pos
_deltaX = _oldX - _x;
_deltaY = _oldY - _y;

if (_leftButton) then {
    GVAR(camDolly) set [0, _deltaX * -100 * GVAR(camSpeed)];
    GVAR(camDolly) set [1, _deltaY * 100 * GVAR(camSpeed)];
} else {
    if (_rightButton) then {
        // Pan/Tilt amount should be influnced by zoom level (it should really be exponential)
        _zoomMod = (GVAR(camZoom) * 0.8) max 1;

        GVAR(camPan) = GVAR(camPan) - ((_deltaX * 360) / _zoomMod);
        GVAR(camTilt) = ((GVAR(camTilt) + ((_deltaY * 180) / _zoomMod)) min 89) max -89;
    };
};

GVAR(mousePos) = [_x,_y];
