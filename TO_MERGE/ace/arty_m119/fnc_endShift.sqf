//fnc_endShift.sqf
#include "script_component.hpp"
detach player;
player playActionNow "crouch";
player removeAction GVAR(shiftActionId);
GVAR(shiftActionId) = -1;
(findDisplay 46) displayRemoveEventHandler ["KeyDown", GVAR(drag_keyDownId)];
GVAR(stopDragging) = true;
