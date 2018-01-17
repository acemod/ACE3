//#define DEBUG_MODE_FULL
#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Make sure this data is read before client/server postInit
call FUNC(getMapData);

ADDON = true;
