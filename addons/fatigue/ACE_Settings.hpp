class ACE_Settings {
    class GVAR(enabled) {
        displayName = CSTRING(enabled_displayName);
        description = CSTRING(enabled_description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(staminaDrainMultiplier) {
        displayName = CSTRING(staminaDrainMultiplier_displayName);
        description = CSTRING(staminaDrainMultiplier_description);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(staminaRecoveryMultiplier) {
        displayName = CSTRING(staminaRecoveryMultiplier_displayName);
        description = CSTRING(staminaRecoveryMultiplier_description);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(loadEffectOnMaxStamina) {
        displayName = CSTRING(loadEffectOnMaxStamina_displayName);
        description = CSTRING(loadEffectOnMaxStamina_description);
        typeName = "SCALAR";
        value = 0.1;
    };
    class GVAR(canNoLongerSprint) {
        displayName = CSTRING(canNoLongerSprint_displayName);
        description = CSTRING(canNoLongerSprint_description);
        typeName = "SCALAR";
        value = 0.5;
    };
    class GVAR(canNoLongerRun) {
        displayName = CSTRING(canNoLongerRun_displayName);
        description = CSTRING(canNoLongerRun_description);
        typeName = "SCALAR";
        value = 0;
    };
    class GVAR(runCooldownAfterExhaustion) {
        displayName = CSTRING(runCooldownAfterExhaustion_displayName);
        description = CSTRING(runCooldownAfterExhaustion_description);
        typeName = "SCALAR";
        value = 10;
    };
};
