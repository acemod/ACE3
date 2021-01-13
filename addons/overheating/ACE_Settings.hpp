class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(enabled_displayName);
        description = CSTRING(enabled_description);
    };
    class GVAR(heatCoef) {
        category = CSTRING(DisplayName);
        typeName = "SCALAR";
        value = 1;
        displayName = CSTRING(heatCoef_displayName);
        description = CSTRING(heatCoef_description);
        sliderSettings[] = {0, 5, 1, 2};
    };
    class GVAR(showParticleEffects) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        isClientSettable = 1;
        value = 1;
        displayName = CSTRING(showParticleEffects_displayName);
        description = CSTRING(showParticleEffects_description);
    };
    class GVAR(showParticleEffectsForEveryone) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        isClientSettable = 1;
        value = 0;
        displayName = CSTRING(showParticleEffectsForEveryone_displayName);
        description = CSTRING(showParticleEffectsForEveryone_description);
    };
    class GVAR(overheatingDispersion) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(overheatingDispersion_displayName);
        description = CSTRING(overheatingDispersion_description);
    };
    class GVAR(particleEffectsAndDispersionDistance) {
        category = CSTRING(DisplayName);
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 3000;
        displayName = CSTRING(particleEffectsAndDispersionDistance_displayName);
        description = CSTRING(particleEffectsAndDispersionDistance_description);
        sliderSettings[] = {1, 5000, 3000, 0};
    };
    class GVAR(overheatingRateOfFire) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(overheatingRateOfFire_displayName);
        description = CSTRING(overheatingRateOfFire_description);
    };
    class GVAR(displayTextOnJam) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        isClientSettable = 1;
        value = 1;
        displayName = CSTRING(DisplayTextOnJam_displayName);
        description = CSTRING(DisplayTextOnJam_description);
    };
    class GVAR(jamChanceCoef) {
        category = CSTRING(DisplayName);
        typeName = "SCALAR";
        value = 1;
        displayName = CSTRING(jamChanceCoef_displayName);
        description = CSTRING(jamChanceCoef_description);
        sliderSettings[] = {0, 5, 1, 2};
    };
    class GVAR(unJamOnReload) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 0;
        displayName = CSTRING(unJamOnReload_displayName);
        description = CSTRING(unJamOnReload_description);
    };
    class GVAR(unJamOnSwapBarrel) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 0;
        displayName = CSTRING(unJamOnSwapBarrel_displayName);
        description = CSTRING(unJamOnSwapBarrel_description);
    };
    class GVAR(unJamFailChance) {
        category = CSTRING(DisplayName);
        typeName = "SCALAR";
        value = 0.1;
        displayName = CSTRING(unJamFailChance_displayName);
        description = CSTRING(unJamFailChance_description);
        sliderSettings[] = {0, 1, 0.1, 2};
    };
    class GVAR(cookoffCoef) {
        category = CSTRING(DisplayName);
        typeName = "SCALAR";
        value = 1;
        displayName = CSTRING(cookoffCoef_displayName);
        description = CSTRING(cookoffCoef_description);
        sliderSettings[] = {0, 5, 1, 2};
    };
};
