#include "script_component.hpp"

ADDON = false;

PREP(handleCamera);
PREP(handleInterface);
PREP(handleKilled);
PREP(handleMouse);
PREP(handleRespawn);
PREP(handleTree);
PREP(moduleSpectatorSettings);
PREP(setSpectator);
PREP(updateCamera);
PREP(updateInterface);
PREP(updateUnits);

// Permanent variables
GVAR(camMode) = 0;
GVAR(camPan) = 0;
GVAR(camPos) = getPos cameraOn;
GVAR(camUnit) = objNull;

GVAR(showComp) = true;
GVAR(showHelp) = true;
GVAR(showInterface) = true;
GVAR(showMap) = false;
GVAR(showTool) = true;
GVAR(showUnit) = true;

GVAR(unitList) = [];
GVAR(unitBlacklist) = [];
GVAR(unitWhitelist) = [];


ADDON = true;
