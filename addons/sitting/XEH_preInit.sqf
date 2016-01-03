#include "script_component.hpp"

ADDON = false;

PREP(addSitActions);
PREP(canSit);
PREP(canStand);
PREP(getRandomAnimation);
PREP(handleInterrupt);
PREP(moduleInit);
PREP(sit);
PREP(stand);

GVAR(initializedClasses) = [];

ADDON = true;
