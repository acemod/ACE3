class ACE_Settings {
    class GVAR(enableCombatDeafness) {
        category = CSTRING(Module_DisplayName);
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(EnableCombatDeafness_DisplayName);
        description = CSTRING(EnableCombatDeafness_Description);
    };
    class GVAR(earplugsVolume) {
        category = CSTRING(Module_DisplayName);
        value = 0.5;
        typeName = "SCALAR";
        sliderSettings[] = {0, 1, 0.5, 1};
    };
    class GVAR(unconsciousnessVolume) {
        category = CSTRING(Module_DisplayName);
        value = 0.4;
        typeName = "SCALAR";
        sliderSettings[] = {0, 1, 0.4, 1};
    };
    class GVAR(disableEarRinging) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(DisableEarRinging_DisplayName);
        description = CSTRING(DisableEarRinging_Description);
    };
    class GVAR(enabledForZeusUnits) {
        category = CSTRING(Module_DisplayName);
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(enabledForZeusUnits_DisplayName);
        description = CSTRING(enabledForZeusUnits_Description);
    };
    class GVAR(autoAddEarplugsToUnits) {
        category = CSTRING(Module_DisplayName);
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(autoAddEarplugsToUnits_DisplayName);
        description = CSTRING(autoAddEarplugsToUnits_Description);
    };
};
