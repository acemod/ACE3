#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
    GVAR(drawing_serverLineMarkers) = [];
    publicVariable QGVAR(drawing_serverLineMarkers);
};

//Add Event Handlers:
["drawing_removeLineMarker", FUNC(removeLineMarker) ] call CBA_fnc_addEventHandler;
["drawing_addLineMarker", FUNC(addLineMarker) ] call CBA_fnc_addEventHandler;

["drawing_requestMarkers", FUNC(copyMapRemoteSend) ] call CBA_fnc_addEventHandler;
["drawing_sendbackMarkers", FUNC(copyMapReceiveMarkers) ] call CBA_fnc_addEventHandler;

ADDON = true;
