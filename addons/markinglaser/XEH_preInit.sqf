#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

GVAR(lasers) = [];
GVAR(localLasers) = [];
GVAR(renderPFH) = -1;
GVAR(updatePFH) = -1;

ADDON = true;
