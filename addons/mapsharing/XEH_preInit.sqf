#include "script_component.hpp"

ADDON = false;

PREP(canOpenSharedMap);
PREP(canShareMap);
PREP(doOpenSharedMap);
PREP(doShareMap);
PREP(drawClickMarkers);
PREP(drawSerializedMarkers);
PREP(handleDrawMainMap);
PREP(handleDrawSharedMap);
PREP(handleMapEvents);
PREP(handleRecieveMarkersEH);
PREP(serializeLocalMarkers);

ADDON = true;
