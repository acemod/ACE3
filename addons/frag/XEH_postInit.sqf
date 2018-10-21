#include "script_component.hpp"

if (isServer) then {
    GVAR(lastFragTime) = -1;
    [QGVAR(frag_eh), {_this call FUNC(frago);}] call CBA_fnc_addEventHandler;
};

["ace_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    // Register fire event handler
    ["ace_firedPlayer", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
    ["ace_firedNonPlayer", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
    ["ace_firedPlayerVehicle", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
    ["ace_firedNonPlayerVehicle", LINKFUNC(fired)] call CBA_fnc_addEventHandler;

    addMissionEventHandler ["EachFrame", {call FUNC(masterPFH)}];
}] call CBA_fnc_addEventHandler;

// Cache for ammo type configs
GVAR(cacheRoundsTypesToTrack) = [false] call CBA_fnc_createNamespace;


// Debug stuff:

#ifdef DRAW_FRAG_INFO
[] call FUNC(dev_startTracing);
#endif

#ifdef DEBUG_MODE_FULL
[true, true, 30] call FUNC(dev_debugAmmo);
#endif
