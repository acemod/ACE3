#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(disabledFactions) = [] call CBA_fnc_createNamespace;
    
ADDON = true;
