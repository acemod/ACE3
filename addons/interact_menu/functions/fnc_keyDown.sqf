//fnc_keyDown.sqf
#include "script_component.hpp"

if(!GVAR(keyDown)) then {
	GVAR(keyDown) = true;
	GVAR(keyDownTime) = diag_tickTime;
};
true
