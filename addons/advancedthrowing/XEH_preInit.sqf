#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(inHand) = false;
GVAR(primed) = false;

GVAR(activeThrowable) = objNull;

GVAR(throwType) = "normal";
GVAR(throwSpeed) = 18;

GVAR(extendedDrop) = false;
GVAR(extendedDropDistance) = 0.2;

GVAR(dropCookedCounter) = 0;

ADDON = true;
