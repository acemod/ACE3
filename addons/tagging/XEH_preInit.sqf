#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(cachedTags) = [];
GVAR(cachedRequiredItems) = [];

#include "initSettings.sqf"

ADDON = true;
