#include "script_component.hpp"


ADDON = false;

PREP(fired);
PREP(frago);
PREP(trackFragRound);
PREP(spallTrack);
PREP(doSpall);
PREP(vectorDiffFast);

GVAR(trackedObjects) = [];
GVAR(blackList) = [];
GVAR(traceFrags) = false;

GVAR(replacedBisArtyWrapper) = true;

GVAR(TOTALFRAGS) = 0;

GVAR(spallIsTrackingCount) = 0;
GVAR(spallHPData) = [];

GVAR(traces) = [];
GVAR(tracesStarted) = false;
GVAR(traceID) = -1;
GVAR(autoTrace) = true;

// TODO setting
GVAR(enabled) = true;


// * Other Shit */
PREP(frag_trace);
PREP(denyFrag);
PREP(BIS_ARTY_WRAPPER);
PREP(startTracing);
PREP(stopTracing);
PREP(clearTraces);
PREP(trackTrace);
PREP(addTrack);
PREP(drawTraces);
PREP(removeTrack);
PREP(spallHP);
PREP(addBlackList);
PREP(addManualTrack);

ADDON = true;
