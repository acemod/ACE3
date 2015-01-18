#include "script_component.hpp"

PREP(addLineMarker);
PREP(blueForceTrackingModule);
PREP(blueForceTrackingUpdate);
PREP(calculateMapScale);
PREP(cancelDrawing);
PREP(canDraw);
PREP(canUseMapTools);
PREP(canUseMapGPS);
PREP(copyMapReceiveMarkers);
PREP(copyMapRemoteSend);
PREP(copyMapStart);
PREP(handleKeyDown);
PREP(handleMouseButton);
PREP(handleMouseMove);
PREP(handleMouseZChanged);
PREP(isInsideMapTool);
PREP(mapStateUpdater);
PREP(openMapGps);
PREP(openMapGpsUpdate);
PREP(removeLineMarker);
PREP(updateMapToolMarkers);
PREP(updateLineMarker);

//Add Event Handlers:
["drawing_removeLineMarker", FUNC(removeLineMarker) ] call EFUNC(common,addEventHandler);
["drawing_addLineMarker", FUNC(addLineMarker) ] call EFUNC(common,addEventHandler);

["drawing_requestMarkers", FUNC(copyMapRemoteSend) ] call EFUNC(common,addEventHandler);
["drawing_sendbackMarkers", FUNC(copyMapReceiveMarkers) ] call EFUNC(common,addEventHandler);
