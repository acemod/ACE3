#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

//Enable/Disable grenade preview when preparing (insert typeNames or just true to disable all)
GVAR(hiddenThrowables) = [];

ADDON = true;
