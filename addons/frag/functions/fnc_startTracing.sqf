#include "script_component.hpp"
if(!GVAR(tracesStarted)) then {
    GVAR(tracesStarted) = true;
    GVAR(traceID) = [FUNC(drawTraces), 0, []] call cba_fnc_addPerFrameHandler;
};
