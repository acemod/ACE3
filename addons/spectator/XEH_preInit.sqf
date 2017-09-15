#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Used by public functions
GVAR(availableModes) = [MODE_FREE, MODE_FPS, MODE_FOLLOW];
GVAR(availableSides) = [west,east,resistance,civilian];
GVAR(availableVisions) = [VISION_NORM,VISION_NVG,0,1];
GVAR(interrupts) = [];
GVAR(unitBlacklist) = [];
GVAR(unitWhitelist) = [];

// Tracks whether spectator is active
GVAR(isSet) = false;

ADDON = true;
