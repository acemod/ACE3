//#define DEBUG_MODE_FULL
#include "script_component.hpp"

TRACE_1("", _this);
PARAMS_1(_shell);

// we already are carrying one, drop it and pick up the new one
_shell setVariable ["ACE_ARTY_OWNER", nil, true];

detach _shell;
_pos = [(getPos player select 0) + sin (getDir player) * 1, (getpos player select 1) + cos (getdir player) * 1, 0];
_shell setPos _pos;
// we need to reveal the shell to all players
{
	_x reveal _shell;
} forEach playableUnits;

player setVariable ["ACE_ARTY_CARRY_SHELL", nil, false];