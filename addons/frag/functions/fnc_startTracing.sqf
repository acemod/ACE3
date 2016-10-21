#include "script_component.hpp"

if (!GVAR(tracesStarted)) then {
    GVAR(tracesStarted) = true;
    GVAR(traceID) = [FUNC(drawTraces)] call CBA_fnc_addPerFrameHandler;
};
