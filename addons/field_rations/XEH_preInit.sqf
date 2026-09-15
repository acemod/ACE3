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

GVAR(cacheP3Ds) = +(uiNamespace getVariable QGVAR(cacheP3Ds)); // cache built at preStart

// Custom Arsenal Tab
if (["ace_arsenal"] call EFUNC(common,isModLoaded)) then {
    [keys FIELD_RATIONS_ITEMS, LLSTRING(DisplayName), ARSENAL_CATEGORY_ICON, -1, true] call EFUNC(arsenal,addRightPanelButton);
};

ADDON = true;
