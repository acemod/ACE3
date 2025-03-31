#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Init array of build locations at preinit
// Can add anything that would work in inArea (triggers, markers or array format [center, a, b, angle, isRectangle, c])
GVAR(locations) = [];

// Custom deploy handlers
GVAR(deployHandlers) = [];
ace_trenches_trenchSupplies = 0;
[
    QGVAR(fortBaseRange),
    "SLIDER",
    "Area of Effect of Fortification Base",
    "7R Fortfications",
    [50, 250, 100, 0],
	true
] call CBA_fnc_addSetting;

[
    QGVAR(fortificationSupplyGain),
    "SLIDER",
    "Return of Fortication Supply Box",
    "7R Fortfications",
    [50, 500, 100, 0],
	true
] call CBA_fnc_addSetting;
[
    QGVAR(rallyTimer),
    "SLIDER",
    "Rally Point Timer",
    "7R Fortfications",
    [0, 900, 300, 0],
	true
] call CBA_fnc_addSetting;
[
    QGVAR(rallyCooldown),
    "SLIDER",
    "Rally Point Cooldown",
    "7R Fortfications",
    [0, 900, 120, 0],
	true
] call CBA_fnc_addSetting;
[
    QGVAR(rallyDistance),
    "SLIDER",
    "Rally Point Enemy Min Distance",
    "7R Fortfications",
    [0, 100, 25, 0],
	true
] call CBA_fnc_addSetting;
[
    QGVAR(rallyCosts),
    "SLIDER",
    "Rally Point Costs",
    "7R Fortfications",
    [0, 500, 50, 0],
	true
] call CBA_fnc_addSetting;
[
    QGVAR(blockDistance),
    "SLIDER",
    "Spawn Point Enemy Block Distance",
    "7R Fortfications",
    [0, 500, 50, 0],
	true
] call CBA_fnc_addSetting;

ace_fobs = [];
ace_dropzones = [];
ace_rally = [];
ace_lastRally = 0;

ADDON = true;