class ACE_Settings {
    class GVAR(EnableCombatDeafness) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(CombatDeafness_DisplayName);
        description = CSTRING(CombatDeafness_Description);
    };
    class GVAR(EarplugsVolume) {
        value = 0.5;
        typeName = "SCALAR";
    };
    class GVAR(UnconsciousnessVolume) {
        value = 0.4;
        typeName = "SCALAR";
    };
    class GVAR(DisableEarRinging) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(DisableEarRinging);
    };
    class GVAR(enabledForZeusUnits) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(enabledForZeusUnits_DisplayName);
        description = CSTRING(enabledForZeusUnits_Description);
    };
};
