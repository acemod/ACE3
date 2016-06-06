#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Trackers
GVAR(inHand) = false;
GVAR(primed) = false;
GVAR(activeThrowable) = objNull;
GVAR(throwType) = "normal";
GVAR(dropMode) = false;

// Defaults
GVAR(dropDistance) = 0.2;
GVAR(lastTickTime) = 0;

ADDON = true;
