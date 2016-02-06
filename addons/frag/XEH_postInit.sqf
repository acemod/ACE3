#include "script_component.hpp"

if(GVAR(EnableDebugTrace) && !isMultiplayer) then {
    GVAR(traceFrags) = true;
    GVAR(autoTrace) = true;
};

if(isServer) then {
    [QGVAR(frag_eh), { _this call FUNC(frago); }] call EFUNC(common,addEventHandler);
};

["SettingsInitialized", {
    //If not enabled, exit
    if (!GVAR(enabled)) exitWith {};

    // Register fire event handler
    ["firedPlayer", DFUNC(firedEH)] call EFUNC(common,addEventHandler);
    ["firedPlayerNonLocal", DFUNC(firedEH)] call EFUNC(common,addEventHandler);
    ["firedNonPlayer", DFUNC(firedEH)] call EFUNC(common,addEventHandler);
    ["firedPlayerVehicle", DFUNC(firedEH)] call EFUNC(common,addEventHandler);
    ["firedPlayerVehicleNonLocal", DFUNC(firedEH)] call EFUNC(common,addEventHandler);
    ["firedNonPlayerVehicle", DFUNC(firedEH)] call EFUNC(common,addEventHandler);

    [FUNC(masterPFH), 0, []] call CBA_fnc_addPerFrameHandler;

}] call EFUNC(common,addEventHandler);

//Cache for ammo type configs
GVAR(cacheRoundsTypesToTrack) = createLocation ["ACE_HashLocation", [-10000,-10000,-10000], 0, 0];
GVAR(cacheRoundsTypesToTrack) setText QGVAR(cacheRoundsTypesToTrack);
