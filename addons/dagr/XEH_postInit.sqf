#include "script_component.hpp"

GVAR(run) = false;
GVAR(useDegrees) = true;
GVAR(updateInterval) = 0.5;

GVAR(numWaypoints) = 0;
GVAR(wpString0) = "";
GVAR(wpString1) = "";
GVAR(wpString2) = "";
GVAR(wpString3) = "";
GVAR(wpString4) = "";
GVAR(wp0) = 0;
GVAR(wp1) = 0;
GVAR(wp2) = 0;
GVAR(wp3) = 0;
GVAR(wp4) = 0;

GVAR(displaySelection) = "DATA";

GVAR(vectorConnected) = false;
GVAR(noVectorData) = true;
GVAR(vectorGrid) = "00000000";

["RangerfinderData", {_this call FUNC(DAGR_VECTOR)}] call EFUNC(common,addEventHandler);
