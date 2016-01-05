#include "script_component.hpp"

if(GVAR(EnableDebugTrace) && !isMultiplayer) then {
    GVAR(traceFrags) = true;
    GVAR(autoTrace) = true;
};

if(isServer) then {
    [QGVAR(frag_eh), { _this call FUNC(frago); }] call EFUNC(common,addEventHandler);
};

[FUNC(masterPFH), 0, []] call CBA_fnc_addPerFrameHandler;

//Cache for ammo type configs
GVAR(cacheRoundsTypesToTrack) = createLocation ["ACE_HashLocation", [-10000,-10000,-10000], 0, 0];
GVAR(cacheRoundsTypesToTrack) setText QGVAR(cacheRoundsTypesToTrack);
