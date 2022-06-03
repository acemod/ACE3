#include "script_component.hpp"

if (isServer && { GVAR(enable) }) then {
    [LINKFUNC(projectileTrackerPFH)] call CBA_fnc_addPerFrameHandler;
    [LINKFUNC(proximityFusePFH)] call CBA_fnc_addPerFrameHandler;
};

