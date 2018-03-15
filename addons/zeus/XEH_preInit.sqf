#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isServer) then {
    [QGVAR(zeusUnitAssigned), FUNC(handleZeusUnitAssigned)] call CBA_fnc_addEventHandler;
};

GVAR(GlobalSkillAI) = [0.5,0.5,0.5,0.5,true,true];

#include "initSettings.sqf"

ADDON = true;
