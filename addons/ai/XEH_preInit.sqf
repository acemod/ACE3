#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isServer) then {
    GVAR(assignNVGthread) = false;
    GVAR(assignNVGstate) = false;
};

#include "initSettings.inc.sqf"

ADDON = true;
