
class CBA_Setting_Boolean_base;
class CBA_Setting_List_base;
class CBA_Setting_Slider_base;

class CBA_Settings {
    class ADDON {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(defaultLockpickStrength): CBA_Setting_Slider_base {
            displayName = CSTRING(DefaultLockpickStrength_DisplayName);
            tooltip = CSTRING(DefaultLockpickStrength_Description);
            min = 0;
            max = 100;
            defaultValue = 10; // ???
        };
        class GVAR(lockVehicleInventory): CBA_Setting_Boolean_base {
            displayName = CSTRING(LockVehicleInventory_DisplayName);
            tooltip = CSTRING(LockVehicleInventory_Description);
            defaultValue = 0;
        };
        class GVAR(vehicleStartingLockState): CBA_Setting_List_base {
            displayName = CSTRING(VehicleStartingLockState_DisplayName);
            tooltip = CSTRING(VehicleStartingLockState_Description);
            values[] = {-1,0,1}; // ?
            defaultIndex = 0;
        };
    };
};
