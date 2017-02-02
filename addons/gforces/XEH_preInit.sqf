#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(GForces) = [];
GVAR(GForces_Index) = 0;

ADDON = true;
