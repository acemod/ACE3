#include "script_component.hpp"

ADDON = false;

PREP(handleCamera);
PREP(handleInterface);
PREP(handleKilled);
PREP(handleMouse);
PREP(handleRespawn);
PREP(handleTree);
PREP(moduleSpectator);
PREP(setSpectator);
PREP(updateUnits);
PREP(updateView);

GVAR(unitList) = [];
GVAR(unitBlacklist) = [];
GVAR(unitWhitelist) = [];

ADDON = true;
