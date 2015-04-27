#include "script_component.hpp"

ADDON = false;

PREP(doSpall);
PREP(fired);
PREP(frago);
PREP(spallTrack);
PREP(trackFragRound);

GVAR(blackList) = [];
GVAR(traceFrags) = false;
GVAR(trackedObjects) = [];

GVAR(TOTALFRAGS) = 0;

GVAR(spallHPData) = [];
GVAR(spallIsTrackingCount) = 0;

GVAR(autoTrace) = true;
GVAR(traceID) = -1;
GVAR(traces) = [];
GVAR(tracesStarted) = false;

// * Other Shit */
PREP(addBlackList);
PREP(addTrack);
PREP(drawTraces);
PREP(removeTrack);
PREP(spallHP);
PREP(startTracing);
PREP(stopTracing);
PREP(trackTrace);

ADDON = true;
