#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"
GVAR(respiratorPairs) = createHashMap;
GVAR(respiratorHoseList) = createHashMap;
GVAR(respiratorHoseTextures) = createHashMap;

ADDON = true;
