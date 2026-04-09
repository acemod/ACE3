#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

GVAR(viewports) = createHashMap;

#ifdef POINT_CONFIG_DEBUG
call compileScript [QPATHTOF(dev\debugPoints.sqf)];
#endif

ADDON = true;
