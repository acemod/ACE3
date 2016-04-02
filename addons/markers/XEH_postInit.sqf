// by commy2
#include "script_component.hpp"

// recieve remote marker data
[QGVAR(setMarkerNetwork), {_this call DFUNC(setMarkerNetwork)}] call CFUNC(addEventHandler);

// recieve marker data for JIP
[QGVAR(setMarkerJIP), {_this call DFUNC(setMarkerJIP)}] call CFUNC(addEventHandler);

// request marker data for JIP
if (isMultiplayer && {!isServer} && {hasInterface}) then {
    GVAR(localLogic) = (createGroup sideLogic) createUnit ["Logic", [0,0,0], [], 0, "NONE"];
    [QGVAR(sendMarkersJIP), [GVAR(localLogic)]] call CFUNC(serverEvent);
};

GVAR(mapDisplaysWithDrawEHs) = [];
GVAR(currentMarkerPosition) = [];
GVAR(currentMarkerAngle) = 0;
GVAR(currentMarkerColorConfigName) = "";
GVAR(currentMarkerConfigName) = "";
