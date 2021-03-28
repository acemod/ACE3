#include "script_component.hpp"
// Author: Garth 'L-H' de Wet
// Initialises the explosives system

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

GVAR(detonationHandlers) = [];

ADDON = true;
