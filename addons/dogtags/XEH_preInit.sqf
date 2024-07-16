#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(disabledFactions) = createHashMap;

if (hasInterface || isServer) then {
    GVAR(dogtagsData) = createHashMap;

    if (!isServer) exitWith {};

    GVAR(idCounter) = 0;
};

ADDON = true;
