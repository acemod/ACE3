#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"
//#include "initSettings.sqf"

GVAR(staminaBarWidth) = 10 * (((safezoneW / safezoneH) min 1.2) / 40);
GVAR(dutyList) = [[], []];

ADDON = true;
