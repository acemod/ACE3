//fnc_keyUp.sqf
#include "script_component.hpp"

GVAR(keyDownSelfAction) = false;
if(GVAR(actionSelected)) then {
	this = GVAR(selectedTarget);
    _player = ACE_Player;
    _target = GVAR(selectedTarget);
	[GVAR(selectedTarget), player] call GVAR(selectedAction);
};
GVAR(expanded) = false;
GVAR(lastPath) = [];
GVAR(menuDepthPath) = [];
GVAR(vecLineMap) = [];
true
