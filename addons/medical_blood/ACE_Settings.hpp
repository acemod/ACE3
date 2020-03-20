class ACE_Settings {
    class GVAR(enabledFor) {
        category = ECSTRING(medical,Category_Medical);
        displayName = CSTRING(MedicalBloodSettings_enabledFor_DisplayName);
        description = CSTRING(MedicalBloodSettings_enabledFor_Description);
        value = 2;
        typeName = "SCALAR";
        values[] = {ECSTRING(Common,Disabled), CSTRING(enabledFor_OnlyPlayers), ECSTRING(Common,Enabled)};
    };
};
