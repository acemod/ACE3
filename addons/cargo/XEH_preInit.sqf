#include "script_component.hpp"

ADDON = false;

PREP(canLoadItemIn);
PREP(canUnloadItem);
PREP(canLoad);
PREP(findNearestVehicle);
PREP(getCargoSpaceLeft);
PREP(GetSizeItem);
PREP(initObject);
PREP(initVehicle);
PREP(handleDestroyed);
PREP(loadItem);
PREP(onMenuOpen);
PREP(unloadItem);
PREP(validateCargoSpace);
PREP(startLoadIn);
PREP(startUnload);
GVAR(initializedItemClasses) = [];

if (isServer) then {
    ["cargo_hideItem", {(_this select 0) hideObjectGlobal (_this select 1);}] call EFUNC(common,addEventHandler);
};

ADDON = true;
