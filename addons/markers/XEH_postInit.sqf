// by commy2
#include "script_component.hpp"

// recieve remote marker data
[QGVAR(setMarkerNetwork), {_this call DFUNC(setMarkerNetwork)}] call EFUNC(common,addEventHandler);

// recieve marker data for JIP
[QGVAR(setMarkerJIP), {_this call DFUNC(setMarkerJIP)}] call EFUNC(common,addEventHandler);

// request marker data for JIP
if (isMultiplayer && {!isServer} && {hasInterface}) then {
    private "_logic";
    _logic = createGroup sideLogic createUnit ["Logic", [0,0,0], [], 0, "NONE"];
    [QGVAR(sendMarkersJIP), [_logic]] call EFUNC(common,serverEvent);
};


GVAR(mapDisplaysWithDrawEHs) = [];
GVAR(currentMarkerPosition) = [];
GVAR(currentMarkerAngle) = 0;
GVAR(currentMarkerColorConfigName) = "";
GVAR(currentMarkerConfigName) = "";