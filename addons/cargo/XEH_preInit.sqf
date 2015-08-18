#include "script_component.hpp"

ADDON = false;

PREP(canLoad);
PREP(canLoadItemIn);
PREP(canUnloadItem);
PREP(findNearestVehicle);
PREP(getCargoSpaceLeft);
PREP(getSizeItem);
PREP(handleDestroyed);
PREP(initObject);
PREP(initVehicle);
PREP(loadItem);
PREP(moduleSettings);
PREP(onMenuOpen);
PREP(startLoadIn);
PREP(startUnload);
PREP(unloadItem);
PREP(validateCargoSpace);

GVAR(initializedItemClasses) = [];

ADDON = true;
