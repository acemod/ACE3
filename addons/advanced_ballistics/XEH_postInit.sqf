#include "script_component.hpp"

GVAR(protractor) = false;
GVAR(allBullets) = createHashMap;

if (!hasInterface) exitWith {};

#include "initKeybinds.inc.sqf"

["CBA_settingsInitialized", {
    // If not enabled, dont't add PFH
    if (!GVAR(enabled)) exitWith {};

    // Run the terrain processor
    [] call FUNC(initializeTerrainExtension);

    // Register fire event handler
    ["ace_firedPlayer", LINKFUNC(handleFired)] call CBA_fnc_addEventHandler;
    ["ace_firedPlayerNonLocal", LINKFUNC(handleFired)] call CBA_fnc_addEventHandler;

    // Register PFH
    [LINKFUNC(handleFirePFH), GVAR(simulationInterval)] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
    call FUNC(diagnoseWeapons);
#endif
