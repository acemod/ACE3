#include "script_component.hpp"

ADDON = false;
LOG(MSG_INIT);

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

ADDON = true;
