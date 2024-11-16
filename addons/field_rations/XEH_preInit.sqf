#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

#define ARSENAL_CATEGORY_ICON QPATHTOF(ui\icon_survival.paa)

// Init arrays of status modifiers
GVAR(thirstModifiers) = [];
GVAR(hungerModifiers) = [];

private _cache = call (uiNamespace getVariable [QGVAR(cacheP3Ds), {ERROR("no cache")}]); // cache built at preStart
// List of p3d water sources (case sensitive) for objects that report `typeOf == ""`
GVAR(waterSourceP3Ds) = _cache select 0;
// List of refill action offsets corresponding to the p3ds in the array above
GVAR(waterSourceOffsets) = _cache select 1;

// Custom Arsenal Tab
if (["ace_arsenal"] call EFUNC(common,isModLoaded)) then {
    [keys FIELD_RATIONS_ITEMS, LLSTRING(DisplayName), ARSENAL_CATEGORY_ICON, -1, true] call EFUNC(arsenal,addRightPanelButton);
};

ADDON = true;
