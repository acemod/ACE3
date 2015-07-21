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
private ["_leftButton","_rightButton","_oldX","_oldY","_deltaX","_deltaY"];

_leftButton = GVAR(mouse) select 0;
_rightButton = GVAR(mouse) select 1;

_oldX = GVAR(mousePos) select 0;
_oldY = GVAR(mousePos) select 1;

// Get change in pos
_deltaX = _oldX - _x;
_deltaY = _oldY - _y;

if (_leftButton && _rightButton) then {
    GVAR(camDolly) set [0, _deltaX * GVAR(camSpeed)];
    GVAR(camDolly) set [1, _deltaY * GVAR(camSpeed)];
} else {
    if (_rightButton) then {
        GVAR(camPan) = GVAR(camPan) - (_deltaX * 360);
        GVAR(camTilt) = ((GVAR(camTilt) + (_deltaY * 180)) min 89) max -89;
    };
};

GVAR(mousePos) = [_x,_y];
