#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

if (GVAR(enabled) && hasInterface && !is3DEN) then {
    ["vehicle",{
        [false] call FUNC(adaptViewDistance);
    }] call CBA_fnc_addPlayerEventHandler;
    ["ACE_controlledUAV", {
        [false] call FUNC(adaptViewDistance);
    }] call CBA_fnc_addEventHandler;
};

ADDON = true;
