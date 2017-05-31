#include "script_component.hpp"

if (GVAR(tracesStarted)) exitWith {};

INFO("Starting Trace Drawing");

GVAR(tracesStarted) = true;
GVAR(traceID) = [LINKFUNC(dev_drawTraces), 0, []] call CBA_fnc_addPerFrameHandler;
