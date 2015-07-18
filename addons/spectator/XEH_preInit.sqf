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
PREP(updateInterface);
PREP(updateUnits);
PREP(updateView);

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
