class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(Enabled);
        description = CSTRING(Enabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(enableStaminaBar) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(EnableStaminaBar);
        description = CSTRING(EnableStaminaBar_Description);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(performanceFactor) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(PerformanceFactor);
        description = CSTRING(PerformanceFactor_Description);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(recoveryFactor) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(RecoveryFactor);
        description = CSTRING(RecoveryFactor_Description);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(loadFactor) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(LoadFactor);
        description = CSTRING(LoadFactor_Description);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(terrainGradientFactor) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(TerrainGradientFactor);
        description = CSTRING(TerrainGradientFactor_Description);
        typeName = "SCALAR";
        value = 1;
    };
};
