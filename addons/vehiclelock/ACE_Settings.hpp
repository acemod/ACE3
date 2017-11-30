class ACE_Settings {
    class GVAR(defaultLockpickStrength) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(DefaultLockpickStrength_DisplayName);
        description = CSTRING(DefaultLockpickStrength_Description);
        value = 10;
        typeName = "SCALAR";
    };
    class GVAR(lockVehicleInventory) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(LockVehicleInventory_DisplayName);
        description = CSTRING(LockVehicleInventory_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(vehicleStartingLockState) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(VehicleStartingLockState_DisplayName);
        description = CSTRING(VehicleStartingLockState_Description);
        value = -1;
        typeName = "SCALAR";
    };
};
