#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

call FUNC(parseConfigForInjuries);

addMissionEventHandler ["Loaded",{
    INFO("Mission Loaded - Reloading medical configs for extension");
    // Reload configs into extension (handle full game restart)
    call FUNC(parseConfigForInjuries);
}];

[QEGVAR(medical,woundReceived), LINKFUNC(woundReceived)] call CBA_fnc_addEventHandler;

ADDON = true;
