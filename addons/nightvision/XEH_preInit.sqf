#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// #9781 - register effects layer ASAP
QGVAR(display) cutText ["", "PLAIN"];

ADDON = true;
