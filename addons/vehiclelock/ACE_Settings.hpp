class ACE_Settings {
    class GVAR(defaultLockpickStrength) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(DefaultLockpickStrength_DisplayName);
        description = CSTRING(DefaultLockpickStrength_Description);
        value = 10;
        typeName = "SCALAR";
        sliderSettings[] = {-1, 60, 5, 1};
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
        sliderSettings[] = {-1, 2, -1, -1}; // ToDo: Make this a list?
    };
};
