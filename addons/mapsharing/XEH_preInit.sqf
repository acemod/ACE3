#include "script_component.hpp"

ADDON = false;

PREP(canOpenSharedMap);
PREP(canShareMap);
PREP(doOpenSharedMap);
PREP(doShareMap);
PREP(drawSerializedMarkers);
PREP(handleMainMapDraw);
PREP(handleMapClick);
PREP(handleRecieveMarkersEH);
PREP(handleSharedMapDraw);
PREP(serializeLocalMarkers);

ADDON = true;
