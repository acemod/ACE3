#include "script_component.hpp"

ADDON = false;

PREP(appMarkKeypadEntry);
PREP(appMenuButtonConnectRangefinder);
PREP(appSettingsLBClick);
PREP(appWaypointsButtonDeleteWP);
PREP(appWaypointsButtonSetWP);
PREP(canShow);
PREP(deviceAddWaypoint);
PREP(deviceDeleteWaypoint);
PREP(deviceGetWaypoints);
PREP(dialogClosedEH);
PREP(mapButtonDownEH);
PREP(mapDoubleTapEH);
PREP(mapOnDrawEH);
PREP(modeMapButtons);
PREP(moduleMapFill);
PREP(openDisplay);
PREP(recieveRangefinderData);
PREP(saveCurrentAndSetNewMode);
PREP(showApplicationPage);
PREP(updateDisplay);

//Functions that are called for each draw of the map:
GVAR(miniMapDrawHandlers) = [];

ADDON = true;
