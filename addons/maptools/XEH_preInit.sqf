#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
    GVAR(drawing_serverLineMarkers) = [];
    publicVariable QGVAR(drawing_serverLineMarkers);
};

//Add Event Handlers:
["drawing_removeLineMarker", FUNC(removeLineMarker) ] call CFUNC(addEventHandler);
["drawing_addLineMarker", FUNC(addLineMarker) ] call CFUNC(addEventHandler);

["drawing_requestMarkers", FUNC(copyMapRemoteSend) ] call CFUNC(addEventHandler);
["drawing_sendbackMarkers", FUNC(copyMapReceiveMarkers) ] call CFUNC(addEventHandler);

ADDON = true;
