#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

GVAR(initializedStaticTypes) = [];
GVAR(vehicleMagCache) = createHashMap;
GVAR(compatibleMagsCache) = createHashMap;
GVAR(compatibleVehicleMagsCache) = createHashMap;

ADDON = true;
