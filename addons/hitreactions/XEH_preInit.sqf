#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

GVAR(armSelections) = [
    "leftshoulder",
    "rightshoulder",
    "lefthand",
    "leftforearm",
    "leftarmroll",
    "rightforearm",
    "rightarmroll",
    "righthand",
    "rightarm"
];

ADDON = true;
