#include "script_component.hpp"

if (GVAR(enableDebugTrace) && {!isMultiplayer}) then {
    GVAR(traceFrags) = true;
    GVAR(autoTrace) = true;
};

if (isServer) then {
    [QGVAR(frag_eh), {_this call FUNC(frago);}] call CBA_fnc_addEventHandler;
};

["ace_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    // Register fire event handler
    ["ace_firedPlayer", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
    ["ace_firedNonPlayer", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
    ["ace_firedPlayerVehicle", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
    ["ace_firedNonPlayerVehicle", LINKFUNC(fired)] call CBA_fnc_addEventHandler;

    [LINKFUNC(masterPFH), 0, []] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;

// Cache for ammo type configs
GVAR(cacheRoundsTypesToTrack) = [false] call CBA_fnc_createNamespace;

#ifdef DEBUG_ENABLED_FRAG
[true, true, 30] call FUNC(dev_debugAmmo);
#endif
