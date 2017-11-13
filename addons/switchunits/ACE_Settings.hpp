class ACE_Settings {
    class GVAR(enableSwitchUnits) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(switchToWest) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(SwitchToWest_DisplayName);
        description = CSTRING(SwitchToWest_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(switchToEast) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(SwitchToEast_DisplayName);
        description = CSTRING(SwitchToEast_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(switchToIndependent) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(SwitchToIndependent_DisplayName);
        description = CSTRING(SwitchToIndependent_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(switchToCivilian) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(SwitchToCivilian_DisplayName);
        description = CSTRING(SwitchToCivilian_Description);
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(enableSafeZone) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(EnableSafeZone_DisplayName);
        description = CSTRING(EnableSafeZone_Description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(safeZoneRadius) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(SafeZoneRadius_DisplayName);
        description = CSTRING(SafeZoneRadius_Description);
        value = 100;
        typeName = "SCALAR";
    };
};
