#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

if (isServer) then {
    ["Helicopter", "Deleted", LINKFUNC(unequipFRIES)] call CBA_fnc_addClassEventHandler;
};

["Helicopter", "Killed", LINKFUNC(unequipFRIES)] call CBA_fnc_addClassEventHandler;

ADDON = true;
