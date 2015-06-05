#include "script_component.hpp"

ADDON = false;
LOG(MSG_INIT);

// Calculate the maximum zoom allowed for this map
call FUNC(determineZoom);

// This spawn is probably worth keeping, as pfh don't work natively on the briefing screen and IDK how reliable the hack we implemented for them is.
// The thread dies as soon as the mission start, so it's not really compiting for scheduler space.
[] spawn {
    // Wait until the map display is detected
    waitUntil {(!isNull findDisplay 12)};

    GVAR(lastStillPosition) = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [0.5, 0.5];
    GVAR(lastStillTime) = ACE_time;
    GVAR(isShaking) = false;

    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {[] call FUNC(updateMapEffects);}];
};

ADDON = true;
