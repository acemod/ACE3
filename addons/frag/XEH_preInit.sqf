#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(replacedBisArtyWrapper) = true;
GVAR(blackList) = [];
GVAR(traceFrags) = false;

GVAR(totalFrags) = 0;

GVAR(spallHPData) = [];
GVAR(spallIsTrackingCount) = 0;

GVAR(autoTrace) = false;
GVAR(traceID) = -1;
GVAR(traces) = [];
GVAR(tracesStarted) = false;

GVAR(lastIterationIndex) = 0;
GVAR(objects) = [];
GVAR(objectTypes) = [];
GVAR(arguments) = [];

ADDON = true;
