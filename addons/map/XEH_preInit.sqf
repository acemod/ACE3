#include "script_component.hpp"

ADDON = false;
LOG(MSG_INIT);

PREP(blueForceTrackingModule);
PREP(blueForceTrackingUpdate);
PREP(determineMapLight);
PREP(determineZoom);
PREP(getMapGridFromPos);
PREP(getMapPosFromGrid);
PREP(getMGRSdata);
PREP(moduleMap);
PREP(onDrawMap);
PREP(prepareMapGrid);
PREP(updateMapEffects);

//Prepare variables for FUNC(getMapGridFromPos):
[] call FUNC(prepareMapGrid);

ADDON = true;
