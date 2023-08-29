#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(captivityEnabled) = false;

GVAR(cableTies) = call (uiNamespace getVariable QGVAR(cableTies));

#include "initSettings.sqf"

ADDON = true;
