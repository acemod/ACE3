#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(currentThrowMode) = 0;
GVAR(currentThrowable) = [];

#include "initSettings.inc.sqf"

ADDON = true;
