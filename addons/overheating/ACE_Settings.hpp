class ACE_Settings {
    class GVAR(DisplayTextOnJam) {
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
};
