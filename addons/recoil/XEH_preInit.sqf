// by commy2
#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(recoilCache) = createHashMap;

// This is too niche to be a setting, but making it not just hardcoded is good
GVAR(extraLauncherShake) = 25.0;


ADDON = true;
