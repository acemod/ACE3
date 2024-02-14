#include "script_component.hpp"

//Add Event Handlers
[QGVAR(setupCustomKey), LINKFUNC(serverSetupCustomKeyEH)] call CBA_fnc_addEventHandler;
[QGVAR(setVehicleLock), LINKFUNC(setVehicleLockEH)] call CBA_fnc_addEventHandler;

["CBA_settingsInitialized", {
    TRACE_2("SettingsInitialized eh",GVAR(LockVehicleInventory),GVAR(VehicleStartingLockState));

    if (hasInterface && {GVAR(LockVehicleInventory)}) then {
        ["CAManBase", "InventoryOpened", LINKFUNC(onOpenInventory)] call CBA_fnc_addClassEventHandler;
    };
    if (isServer && {GVAR(VehicleStartingLockState) != -1}) then {
        [{
            TRACE_1("adding lock handler",GVAR(VehicleStartingLockState));
            {
                [_x, "initpost", LINKFUNC(handleVehicleInitPost), true, [], true] call CBA_fnc_addClassEventHandler;
            } forEach ["Car", "Tank", "Air"];
        }, [], 0.25] call CBA_fnc_waitAndExecute;
    };
}] call CBA_fnc_addEventHandler;
