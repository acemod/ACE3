#include "script_component.hpp"

if(GVAR(EnableDebugTrace) && !isMultiplayer) then {
    GVAR(traceFrags) = true;
    GVAR(autoTrace) = true;
};

if(isServer) then {
    [QGVAR(frag_eh), { _this call FUNC(frago); }] call ace_common_fnc_addEventHandler;
};

[FUNC(masterPFH), 0, []] call CBA_fnc_addPerFrameHandler;