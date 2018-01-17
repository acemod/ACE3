#include "script_component.hpp"

if(GVAR(EnableDebugTrace) && !isMultiplayer) then {
    GVAR(traceFrags) = true;
    GVAR(autoTrace) = true;
};

if(isServer) then {
    [QGVAR(frag_eh), { _this call FUNC(frago); }] call CBA_fnc_addEventHandler;
};

["ace_settingsInitialized", {
    //If not enabled, exit
    if (!GVAR(enabled)) exitWith {};

    // Register fire event handler
    ["ace_firedPlayer", DFUNC(fired)] call CBA_fnc_addEventHandler;
    ["ace_firedNonPlayer", DFUNC(fired)] call CBA_fnc_addEventHandler;
    ["ace_firedPlayerVehicle", DFUNC(fired)] call CBA_fnc_addEventHandler;
    ["ace_firedNonPlayerVehicle", DFUNC(fired)] call CBA_fnc_addEventHandler;

    [FUNC(masterPFH), 0, []] call CBA_fnc_addPerFrameHandler;

}] call CBA_fnc_addEventHandler;

//Cache for ammo type configs
GVAR(cacheRoundsTypesToTrack) = createLocation ["ACE_HashLocation", [-10000,-10000,-10000], 0, 0];
GVAR(cacheRoundsTypesToTrack) setText QGVAR(cacheRoundsTypesToTrack);
