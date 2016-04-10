#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(blackList) = [];
GVAR(traceFrags) = false;

GVAR(TOTALFRAGS) = 0;

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
