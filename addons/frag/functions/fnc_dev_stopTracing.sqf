#include "script_component.hpp"

if (!GVAR(tracesStarted)) exitWith {};

INFO("Ending Trace Drawing");

GVAR(tracesStarted) = false;
[GVAR(traceID)] call CBA_fnc_removePerFrameHandler;
