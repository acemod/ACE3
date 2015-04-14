#include "script_component.hpp"
if(GVAR(tracesStarted)) then {
    GVAR(tracesStarted) = false;
    [GVAR(traceID)] call cba_fnc_removePerFrameHandler;
};