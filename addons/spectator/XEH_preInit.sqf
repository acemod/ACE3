#include "script_component.hpp"

ADDON = false;

PREP(cacheUnitInfo);
PREP(cycleCamera);
PREP(handleCamera);
PREP(handleCompass);
PREP(handleInterface);
PREP(handleKilled);
PREP(handleMouse);
PREP(handleRespawn);
PREP(handleToolbar);
PREP(handleUnits);
PREP(moduleSpectatorSettings);
PREP(setCameraAttributes);
PREP(setSpectator);
PREP(transitionCamera);
PREP(toggleInterface);
PREP(updateCameraModes);
PREP(updateUnits);
PREP(updateVisionModes);

// Permanent variables
GVAR(availableModes) = [0,1,2];
GVAR(availableVisions) = [-2,-1,0,1];

GVAR(camMode) = 0;
GVAR(camPan) = 0;
GVAR(camPos) = ATLtoASL [worldSize * 0.5, worldSize * 0.5, 20];
GVAR(camSpeed) = 1;
GVAR(camTilt) = -10;
GVAR(camUnit) = objNull;
GVAR(camVision) = -2;
GVAR(camZoom) = 1.25;

GVAR(showComp) = true;
GVAR(showHelp) = true;
GVAR(showIcons) = true;
GVAR(showInterface) = true;
GVAR(showMap) = false;
GVAR(showTool) = true;
GVAR(showUnit) = true;

GVAR(unitList) = [];
GVAR(unitBlacklist) = [];
GVAR(unitWhitelist) = [];

ADDON = true;
