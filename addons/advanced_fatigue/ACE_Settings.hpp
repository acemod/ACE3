class ACE_Settings {
    class GVAR(enabled) {
        category = "Advanced Fatigue";
        displayName = CSTRING(Enabled);
        description = CSTRING(Enabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(enableStaminaBar) {
        category = "Advanced Fatigue";
        displayName = CSTRING(EnableStaminaBar);
        description = CSTRING(EnableStaminaBar_Description);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(performanceFactor) {
        category = "Advanced Fatigue";
        displayName = CSTRING(PerformanceFactor);
        description = CSTRING(PerformanceFactor_Description);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(recoveryFactor) {
        category = "Advanced Fatigue";
        displayName = CSTRING(RecoveryFactor);
        description = CSTRING(RecoveryFactor_Description);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(loadFactor) {
        category = "Advanced Fatigue";
        displayName = CSTRING(LoadFactor);
        description = CSTRING(LoadFactor_Description);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(terrainGradientFactor) {
        category = "Advanced Fatigue";
        displayName = CSTRING(TerrainGradientFactor);
        description = CSTRING(TerrainGradientFactor_Description);
        typeName = "SCALAR";
        value = 1;
    };
};
