#include "script_component.hpp"

private ["_x","_y","_leftButton","_rightButton","_oldX","_oldY","_deltaX","_deltaY"];

_x = GVAR(mousePos) select 0;
_y = GVAR(mousePos) select 1;
_leftButton = GVAR(mouse) select 0;
_rightButton = GVAR(mouse) select 1;

_oldX = GVAR(mousePosOld) select 0;
_oldY = GVAR(mousePosOld) select 1;

// Get change in pos
_deltaX = _oldX - _x;
_deltaY = _oldY - _y;
GVAR(mouseDelta) = [_deltaX, _deltaY];

if (_rightButton && !_leftButton) then {
    GVAR(camPan) = GVAR(camPan) - (_deltaX * 360);
    GVAR(camTilt) = ((GVAR(camTilt) + (_deltaY * 180)) min 89) max -89;
};

GVAR(mousePosOld) = [_x,_y];
