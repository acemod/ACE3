#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
    ["zeusUnitAssigned", FUNC(handleZeusUnitAssigned)] call EFUNC(common,addEventHandler);
};

ADDON = true;
