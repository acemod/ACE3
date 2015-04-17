// by commy2
#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(holdKeyHandler) = -1;
GVAR(isKeyDownAzimuth) = false;
GVAR(isKeyDownDistance) = false;
GVAR(keyDownTimeAzimuth) = -1;
GVAR(keyDownTimeDistance) = -1;
GVAR(useMil) = false;
GVAR(useFeet) = false;
GVAR(modeReticle) = 0;
GVAR(illuminate) = false;

#include "initKeybinds.sqf"
