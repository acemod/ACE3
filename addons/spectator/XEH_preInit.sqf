#include "script_component.hpp"

ADDON = false;

PREP(handleCamera);
PREP(handleCompass);
PREP(handleInterface);
PREP(handleKilled);
PREP(handleMouse);
PREP(handleRespawn);
PREP(handleToolbar);
PREP(handleUnits);
PREP(moduleSpectatorSettings);
PREP(setSpectator);
PREP(updateCamera);
PREP(updateInterface);
PREP(updateUnits);

// Permanent variables
GVAR(camFocus) = -1;
GVAR(camMode) = 0;
GVAR(camPan) = 0;
GVAR(camPos) = [worldSize * 0.5,worldSize * 0.5,0];
GVAR(camSpeed) = 1;
GVAR(camUnit) = objNull;
GVAR(camZoom) = 1.3;

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
