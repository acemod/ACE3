#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

GVAR(initializedStaticTypes) = [];

// Config-derived, so they hold for the whole session. Filled lazily by FUNC(compatibleMagazines) and
// FUNC(getCarryMagazine) rather than on weapon swap, a CSW without a proxy weapon needs them too
GVAR(vehicleMagCache) = createHashMap;
GVAR(compatibleCarryMagsCache) = createHashMap;
GVAR(compatibleVehicleMagsCache) = createHashMap;

ADDON = true;

