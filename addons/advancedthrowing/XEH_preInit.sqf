#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Trackers
GVAR(inHand) = false;
GVAR(primed) = false;
GVAR(activeThrowable) = objNull;
GVAR(throwType) = "normal";
GVAR(extendedDrop) = false;

// Defaults
GVAR(extendedDropDistance) = 0.2;
GVAR(lastTickTime) = 0;

ADDON = true;
