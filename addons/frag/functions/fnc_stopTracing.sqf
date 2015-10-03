#include "script_component.hpp"
if(GVAR(tracesStarted)) then {
    GVAR(tracesStarted) = false;
    [GVAR(traceID)] call CBA_fnc_removePerFrameHandler;
};
