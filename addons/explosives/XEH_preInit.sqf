#include "script_component.hpp"
// Author: Garth 'L-H' de Wet
// Initialises the explosives system

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initKeybinds.inc.sqf"
#include "initSettings.inc.sqf"

GVAR(detonationHandlers) = [];
GVAR(excludedMines) = [];

GVAR(defusalKits) = keys (uiNamespace getVariable QGVAR(defusalKits));

ADDON = true;
