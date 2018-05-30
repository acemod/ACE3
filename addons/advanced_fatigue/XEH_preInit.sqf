#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

GVAR(staminaBarWidth) = 10 * (((safezoneW / safezoneH) min 1.2) / 40);
GVAR(dutyList) = [[], []];

ADDON = true;
