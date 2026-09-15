#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

if (isServer) then {
    ["Air", "Deleted", LINKFUNC(unequipFRIES)] call CBA_fnc_addClassEventHandler;
};

["Air", "Killed", LINKFUNC(unequipFRIES)] call CBA_fnc_addClassEventHandler;

ADDON = true;
