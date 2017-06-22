#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(blackList) = [];
GVAR(traceFrags) = false;

GVAR(spallHPData) = [];
GVAR(spallIsTrackingCount) = 0;

GVAR(traceID) = -1;
GVAR(traces) = [];
GVAR(tracesStarted) = false;

GVAR(lastIterationIndex) = 0;
GVAR(objects) = [];
GVAR(arguments) = [];

ADDON = true;
