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
PREP(moduleSettings);
PREP(loadItem);
PREP(onMenuOpen);
PREP(unloadItem);
PREP(validateCargoSpace);
PREP(startLoadIn);
PREP(startUnload);
GVAR(initializedItemClasses) = [];

if (isServer) then {
    ["cargo_hideItem", {params ["_object", "_status"]; _object hideObjectGlobal _status;}] call EFUNC(common,addEventHandler);
};

ADDON = true;
