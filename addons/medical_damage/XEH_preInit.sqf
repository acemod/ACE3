#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

call FUNC(parseConfigForInjuries);

// Used for armor penetration calculation
GVAR(ammoCache) = createHashMap;

// Open wound counts at the start of each woundReceived call in progress, keyed by unit, see woundReceived
GVAR(woundContexts) = [];

/*
addMissionEventHandler ["Loaded",{
    INFO("Mission Loaded - Reloading medical configs for extension");
    // Reload configs into extension (handle full game restart)
    call FUNC(parseConfigForInjuries);
}];
*/

[QEGVAR(medical,woundReceived), LINKFUNC(woundReceived)] call CBA_fnc_addEventHandler;

ADDON = true;
