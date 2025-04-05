#include "script_component.hpp"
// Author: Garth 'L-H' de Wet
// Initialises the explosives system

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

GVAR(defusalKits) = keys (uiNamespace getVariable QGVAR(defusalKits));
GVAR(detonators) = keys (uiNamespace getVariable QGVAR(detonators));

GVAR(activeTrigger) = "";

GVAR(detonationHandlers) = [];
GVAR(excludedMines) = [];

GVAR(placedCount) = 0;
GVAR(cellphoneIEDs) = createHashMap;

if (hasInterface) then {
    GVAR(setup) = objNull;
    GVAR(pfeh_running) = false;
    GVAR(currentSpeedDial) = 0;
};

ADDON = true;
