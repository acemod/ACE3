#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

GVAR(flagItemCache) = +(uiNamespace getVariable [QGVAR(flagItemCache), createHashMap]);
GVAR(carrierItemMapping) = +(uiNamespace getVariable [QGVAR(carrierItemMapping), createHashMap]);

ADDON = true;
