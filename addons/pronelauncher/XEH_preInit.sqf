#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

["KeyDown", {_this call FUNC(onKeyDown)}] call CBA_fnc_addDisplayHandler;

ADDON = true;
