#include "script_component.hpp"

if (!GVAR(tracesStarted)) exitWith {};
GVAR(tracesStarted) = false;
[GVAR(traceID)] call CBA_fnc_removePerFrameHandler;
