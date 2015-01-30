#include "script_component.hpp"

ADDON = false;

PREP(addKeyForVehicle);
PREP(getVehicleSideKey);
PREP(hasKeyForVehicle);
PREP(lockpick);
PREP(moduleInit);
PREP(moduleSync);
PREP(serverSetupCustomKeyEH);
PREP(setVehicleLockEH);

//Add Event Handlers
["SetupCustomKey", {_this call FUNC(serverSetupCustomKeyEH)}] call EFUNC(common,addEventHandler);
["SetVehicleLock", {_this call FUNC(setVehicleLockEH)}] call EFUNC(common,addEventHandler);

ADDON = true;
