class ACE_Settings {
    class GVAR(enableSwitchUnits) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(EnableSwitchUnits_DisplayName);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(switchToWest) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(SwitchToWest_DisplayName);
        description = CSTRING(SwitchToWest_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(switchToEast) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(SwitchToEast_DisplayName);
        description = CSTRING(SwitchToEast_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(switchToIndependent) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(SwitchToIndependent_DisplayName);
        description = CSTRING(SwitchToIndependent_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(switchToCivilian) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(SwitchToCivilian_DisplayName);
        description = CSTRING(SwitchToCivilian_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(enableSafeZone) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(EnableSafeZone_DisplayName);
        description = CSTRING(EnableSafeZone_Description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(safeZoneRadius) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(SafeZoneRadius_DisplayName);
        description = CSTRING(SafeZoneRadius_Description);
        value = 100;
        typeName = "SCALAR";
        sliderSettings[] = {0, 1000, 100, 0};
    };
};
