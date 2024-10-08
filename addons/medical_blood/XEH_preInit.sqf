#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// blood object model namespace
GVAR(models) = createHashMapFromArray [
    // higher number means bigger model
    ["blooddrop_1", QPATHTOF(data\ace_drop_1.p3d)],
    ["blooddrop_2", QPATHTOF(data\ace_drop_2.p3d)],
    ["blooddrop_3", QPATHTOF(data\ace_drop_3.p3d)],
    ["blooddrop_4", QPATHTOF(data\ace_drop_4.p3d)]
];

ADDON = true;
