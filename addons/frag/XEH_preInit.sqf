#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;


GVAR(materialSpallCache) = createHashMap;
GVAR(spallRoundCache) = createHashMap;
GVAR(lastSpallTime) = -2;

GVAR(shouldFragCache) = createHashMap;
GVAR(fragInfoCache) = createHashMap;
GVAR(lastFragTime) = -2;


#include "initSettings.inc.sqf"

#ifdef DEBUG_MODE_DRAW
GVAR(dev_trackLines) = createHashMap;
GVAR(dev_hitBoxes) = createHashMap;
GVAR(dev_failedToDelete) = 0;
GVAR(dev_eventSpheres) = [];
#include "initSettingsDebug.inc.sqf"
#endif


ADDON = true;
