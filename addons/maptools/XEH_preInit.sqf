#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

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
