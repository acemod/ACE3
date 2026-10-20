#include "script_component.hpp"

ADDON = false;

GVAR(zeroAngleCorrectionData) = createHashMap;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

ADDON = true;
