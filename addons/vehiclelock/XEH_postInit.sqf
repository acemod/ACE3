#include "script_component.hpp"

//Add Event Handlers
[QGVAR(setupCustomKey), {_this call FUNC(serverSetupCustomKeyEH)}] call CBA_fnc_addEventHandler;
[QGVAR(setVehicleLock), {_this call FUNC(setVehicleLockEH)}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitwith {};

["ace_settingsInitialized", {
    TRACE_1("SettingsInitialized eh",GVAR(LockVehicleInventory));

    if (GVAR(LockVehicleInventory)) then {
        ["CAManBase", "InventoryOpened", {_this call FUNC(onOpenInventory);}] call CBA_fnc_addClassEventHandler;
    };
}] call CBA_fnc_addEventHandler;
