#include "script_component.hpp"

#include "initKeybinds.inc.sqf"

GVAR(Protractor) = false;
GVAR(ProtractorStart) = CBA_missionTime;
GVAR(allBullets) = createHashMap;
GVAR(currentGrid) = 0;

if (!hasInterface) exitWith {};

#include "initKeybinds.inc.sqf"

["CBA_settingsInitialized", {
    //If not enabled, dont't add PFEH
    if (!GVAR(enabled)) exitWith {};

    //Run the terrain processor
    [] call FUNC(initializeTerrainExtension);

    // Register fire event handler
    ["ace_firedPlayer", LINKFUNC(handleFired)] call CBA_fnc_addEventHandler;
    ["ace_firedPlayerNonLocal", LINKFUNC(handleFired)] call CBA_fnc_addEventHandler;

    // Register Perframe Handler
    [LINKFUNC(handleFirePFH), GVAR(simulationInterval)] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
    call FUNC(diagnoseWeapons);
#endif
