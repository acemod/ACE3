#include "script_component.hpp"

// This is too niche to be a setting, but making it not a magic number is good
GVAR(extraLauncherShake) = 25.0;

// Register fire event handler
["ace_firedPlayer", LINKFUNC(camShake)] call CBA_fnc_addEventHandler;
