#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

//Functions that are called for each draw of the map:
GVAR(miniMapDrawHandlers) = [];

#include "initSettings.sqf"

ADDON = true;
