#include "script_component.hpp"

if(GVAR(EnableDebugTrace) && !isMultiplayer) then {
    GVAR(traceFrags) = true;
    GVAR(autoTrace) = true;
};

if(isServer) then {
    [QGVAR(frag_eh), { _this call FUNC(frago); }] call CFUNC(addEventHandler);
};

["SettingsInitialized", {
    //If not enabled, exit
    if (!GVAR(enabled)) exitWith {};

    // Register fire event handler
    ["firedPlayer", DFUNC(fired)] call CFUNC(addEventHandler);
    ["firedPlayerNonLocal", DFUNC(fired)] call CFUNC(addEventHandler);
    ["firedNonPlayer", DFUNC(fired)] call CFUNC(addEventHandler);
    ["firedPlayerVehicle", DFUNC(fired)] call CFUNC(addEventHandler);
    ["firedPlayerVehicleNonLocal", DFUNC(fired)] call CFUNC(addEventHandler);
    ["firedNonPlayerVehicle", DFUNC(fired)] call CFUNC(addEventHandler);

    [FUNC(masterPFH), 0, []] call CBA_fnc_addPerFrameHandler;

}] call CFUNC(addEventHandler);

//Cache for ammo type configs
GVAR(cacheRoundsTypesToTrack) = createLocation ["ACE_HashLocation", [-10000,-10000,-10000], 0, 0];
GVAR(cacheRoundsTypesToTrack) setText QGVAR(cacheRoundsTypesToTrack);
