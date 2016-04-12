#include "script_component.hpp"

//Add Event Handlers
["VehicleLock_SetupCustomKey", {_this call FUNC(serverSetupCustomKeyEH)}] call CFUNC(addEventHandler);
["VehicleLock_SetVehicleLock", {_this call FUNC(setVehicleLockEH)}] call CFUNC(addEventHandler);
