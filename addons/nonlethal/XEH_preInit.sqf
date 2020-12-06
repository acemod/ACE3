#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (ifServer) then {
    //["CAManBase", "Dammaged", {_this call FUNC(dammaged)}] call CBA_fnc_addClassEventHandler;
};

ADDON = true;
