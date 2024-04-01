#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

ADDON = true;

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

if (isNil QGVAR(safePickupDistance)) then {GVAR(safePickupDistance) = DEFAULT_PICKUP_DISTANCE};
if (isNil QGVAR(undroppableWeapons)) then {GVAR(undroppableWeapons) = DEFAULT_UNDROPPABLE_WEAPONS};
