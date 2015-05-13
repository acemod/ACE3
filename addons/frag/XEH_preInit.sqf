#include "script_component.hpp"

ADDON = false;

PREP(doSpall);
PREP(fired);
PREP(frago);
PREP(spallTrack);

GVAR(blackList) = [];
GVAR(traceFrags) = false;

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

// New tracking mechanisms
PREP(masterPFH);
PREP(pfhRound);
PREP(addPfhRound);
PREP(removePfhRound); // THIS SHOULD ABE USED SPARINGLY

GVAR(objects) = [];
GVAR(objectTypes) = [];
GVAR(arguments) = [];

ADDON = true;
