#include "script_component.hpp"

//Add Event Handlers
["VehicleLock_SetupCustomKey", {_this call FUNC(serverSetupCustomKeyEH)}] call EFUNC(common,addEventHandler);
["VehicleLock_SetVehicleLock", {_this call FUNC(setVehicleLockEH)}] call EFUNC(common,addEventHandler);

if (!hasInterface) exitwith {};

["SettingsInitialized", {
    TRACE_1("SettingsInitialized eh",GVAR(LockVehicleInventory));

    if (GVAR(LockVehicleInventory)) then {
        ["CAManBase", "InventoryOpened", {_this call FUNC(onOpenInventory);}] call CBA_fnc_addClassEventHandler;
    };
}] call EFUNC(common,addEventHandler);
