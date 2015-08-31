#include "script_component.hpp"

ADDON = false;

PREP(addLineMarker);
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
PREP(openMapGps);
PREP(openMapGpsUpdate);
PREP(removeLineMarker);
PREP(updateMapToolMarkers);
PREP(updateLineMarker);

if (isServer) then {
    GVAR(drawing_serverLineMarkers) = [];
    publicVariable QGVAR(drawing_serverLineMarkers);
};

//Add Event Handlers:
["drawing_removeLineMarker", FUNC(removeLineMarker) ] call EFUNC(common,addEventHandler);
["drawing_addLineMarker", FUNC(addLineMarker) ] call EFUNC(common,addEventHandler);

["drawing_requestMarkers", FUNC(copyMapRemoteSend) ] call EFUNC(common,addEventHandler);
["drawing_sendbackMarkers", FUNC(copyMapReceiveMarkers) ] call EFUNC(common,addEventHandler);

ADDON = true;
