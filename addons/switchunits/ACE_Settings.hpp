class ACE_Settings {
    class GVAR(enableSwitchUnits) {
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(switchToWest) {
        displayName = CSTRING(SwitchToWest_DisplayName);
        description = CSTRING(SwitchToWest_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(switchToEast) {
        displayName = CSTRING(SwitchToEast_DisplayName);
        description = CSTRING(SwitchToEast_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(switchToIndependent) {
        displayName = CSTRING(SwitchToIndependent_DisplayName);
        description = CSTRING(SwitchToIndependent_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(switchToCivilian) {
        displayName = CSTRING(SwitchToCivilian_DisplayName);
        description = CSTRING(SwitchToCivilian_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(enableSafeZone) {
        displayName = CSTRING(EnableSafeZone_DisplayName);
        description = CSTRING(EnableSafeZone_Description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(safeZoneRadius) {
        displayName = CSTRING(SafeZoneRadius_DisplayName);
        description = CSTRING(SafeZoneRadius_Description);
        value = 100;
        typeName = "SCALAR";
    };
};
