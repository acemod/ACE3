#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

GVAR(staminaBarWidth) = 10 * (((safeZoneW / safeZoneH) min 1.2) / 40);
GVAR(dutyList) = createHashMap;
GVAR(setAnimExclusions) = [];
GVAR(inertia) = 0;
GVAR(inertiaCache) = createHashMap;

ADDON = true;
