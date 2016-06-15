class ACE_Settings {
    class GVAR(displayTextOnJam) {
        typeName = "BOOL";
        isClientSettable = 1;
        value = 1;
        displayName = CSTRING(DisplayTextOnJam_displayName);
        description = CSTRING(DisplayTextOnJam_description);
    };
    class GVAR(showParticleEffects) {
        typeName = "BOOL";
        isClientSettable = 1;
        value = 1;
        displayName = CSTRING(showParticleEffects_displayName);
        description = CSTRING(showParticleEffects_description);
    };
    class GVAR(showParticleEffectsForEveryone) {
        typeName = "BOOL";
        isClientSettable = 1;
        value = 0;
        displayName = CSTRING(showParticleEffectsForEveryone_displayName);
        description = CSTRING(showParticleEffectsForEveryone_description);
    };
    class GVAR(overheatingDispersion) {
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(overheatingDispersion_displayName);
        description = CSTRING(overheatingDispersion_description);
    };
    class GVAR(unJamOnreload) {
        typeName = "BOOL";
        value = 0;
        displayName = CSTRING(unJamOnreload_displayName);
        description = CSTRING(unJamOnreload_description);
    };
    class GVAR(unJamFailChance) {
        typeName = "SCALAR";
        value = 0.1;
        displayName = CSTRING(unJamFailChance_displayName);
        description = CSTRING(unJamFailChance_description);
    };
    class GVAR(enabled) {
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(enabled_displayName);
        description = CSTRING(enabled_description);
    };
};
