#include "script_component.hpp"

//Add Event Handlers
["VehicleLock_SetupCustomKey", {_this call FUNC(serverSetupCustomKeyEH)}] call EFUNC(common,addEventHandler);
["VehicleLock_SetVehicleLock", {_this call FUNC(setVehicleLockEH)}] call EFUNC(common,addEventHandler);
