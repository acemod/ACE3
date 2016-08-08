// by commy2
#include "script_component.hpp"

// recieve remote marker data
[QGVAR(setMarkerNetwork), {_this call DFUNC(setMarkerNetwork)}] call CBA_fnc_addEventHandler;

// recieve marker data for JIP
[QGVAR(setMarkerJIP), {_this call DFUNC(setMarkerJIP)}] call CBA_fnc_addEventHandler;

// request marker data for JIP
if (isMultiplayer && {!isServer} && {hasInterface}) then {
    GVAR(localLogic) = (createGroup sideLogic) createUnit ["Logic", [0,0,0], [], 0, "NONE"];
    [QGVAR(sendMarkersJIP), [GVAR(localLogic)]] call CBA_fnc_serverEvent;
};

GVAR(mapDisplaysWithDrawEHs) = [];
GVAR(currentMarkerPosition) = [];
GVAR(currentMarkerAngle) = 0;
GVAR(currentMarkerColorConfigName) = "";
GVAR(currentMarkerConfigName) = "";
