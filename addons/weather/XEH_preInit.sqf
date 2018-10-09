//#define DEBUG_MODE_FULL
#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Make sure this data is read before client/server postInit
call FUNC(getMapData);

ADDON = true;
