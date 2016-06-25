#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
    [QGVAR(zeusUnitAssigned), FUNC(handleZeusUnitAssigned)] call CBA_fnc_addEventHandler;
};

GVAR(GlobalSkillAI) = [0.5,0.5,0.5,0.5,true,true];

ADDON = true;
