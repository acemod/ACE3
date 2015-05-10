#include "script_component.hpp"

ADDON = false;
LOG(MSG_INIT);

PREP(blueForceTrackingModule);
PREP(blueForceTrackingUpdate);
PREP(determineMapLight);
PREP(determineZoom);
PREP(getMapGridFromPos);
PREP(getMGRSdata);
PREP(moduleMap);
PREP(onDrawMap);
PREP(updateMapEffects);

ADDON = true;
