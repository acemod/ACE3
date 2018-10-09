class ACE_Settings {
    class GVAR(displayTextOnJam) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        isClientSettable = 1;
        value = 1;
        displayName = CSTRING(DisplayTextOnJam_displayName);
        description = CSTRING(DisplayTextOnJam_description);
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
    class GVAR(unJamOnreload) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 0;
        displayName = CSTRING(unJamOnreload_displayName);
        description = CSTRING(unJamOnreload_description);
    };
    class GVAR(unJamFailChance) {
        category = CSTRING(DisplayName);
        typeName = "SCALAR";
        value = 0.1;
        displayName = CSTRING(unJamFailChance_displayName);
        description = CSTRING(unJamFailChance_description);
        sliderSettings[] = {0, 1, 0.1, 2};
    };
    class GVAR(enabled) {
        category = CSTRING(DisplayName);
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(enabled_displayName);
        description = CSTRING(enabled_description);
    };
};
