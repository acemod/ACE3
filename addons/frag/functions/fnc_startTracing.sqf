#include "script_component.hpp"

if (GVAR(tracesStarted)) exitWith {};
GVAR(tracesStarted) = true;
GVAR(traceID) = [FUNC(drawTraces)] call CBA_fnc_addPerFrameHandler;
