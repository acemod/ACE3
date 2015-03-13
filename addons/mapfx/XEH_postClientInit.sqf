#include "script_component.hpp"

ADDON = false;
LOG(MSG_INIT);

call FUNC(determineZoom);

//Probably need this spawn, because CBA_fnc_addPerFrameHandler doesn't work durring briefing.
[] spawn {
    // Wait until the map display is detected
    waitUntil {(!isNull findDisplay 12)};

    GVAR(lastStillPosition) = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [0.5, 0.5];
    GVAR(lastStillTime) = time;
    GVAR(isShaking) = false;

    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {[] call FUNC(updateMapFx);}];

};

ADDON = true;
