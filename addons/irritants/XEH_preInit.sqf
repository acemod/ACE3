#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

GVAR(smoke_pfh) = -1;
GVAR(openVehicleCache) = createHashMap;
GVAR(openSeatCache) = createHashMap;

ADDON = true;
