class ACE_Settings {
    // Settings without EGVAR are new and don't need backwards compat
    class GVAR(advancedBandages) {
        displayName = CSTRING(advancedBandages_DisplayName);
        description = CSTRING(advancedBandages_Description);
        typeName = "BOOL";
        value = 1;
        // todo: I don't like that wound reopening requires this setting to be enabled, they should be independent
    };
    class GVAR(advancedDiagnose) {
        displayName = CSTRING(advancedDiagnose_DisplayName);
        description = CSTRING(advancedDiagnose_Description);
        typeName = "BOOL";
        value = 1;
        // todo: this setting just disables some treatment options, remove?
    };
    class GVAR(advancedMedication) {
        displayName = CSTRING(advancedMedication_DisplayName);
        description = CSTRING(advancedMedication_Description);
        typeName = "BOOL";
        value = 1;
    };
    // todo: the strings for all three advanced bandages/medication/diagnose settings are terribly ambigious
    class EGVAR(medical,allowLitterCreation) {
        category = ECSTRING(medical,Category_Medical);
        displayName = CSTRING(allowLitterCreation);
        description = CSTRING(allowLitterCreation_Description);
        typeName = "BOOL";
        value = 1;
    };
    class EGVAR(medical,CPRcreatesPulse) {
        category = ECSTRING(medical,Category_Medical);
        displayName = CSTRING(CPRcreatesPulse);
        description = CSTRING(CPRcreatesPulse_Description);
        typeName = "BOOL";
        value = 1;
    };
    class EGVAR(medical,litterCleanUpDelay) {
        category = ECSTRING(medical,Category_Medical);
        displayName = CSTRING(litterCleanUpDelay);
        description = CSTRING(litterCleanUpDelay_Description);
        typeName = "SCALAR";
        value = 0;
    };
    class EGVAR(medical,litterSimulationDetail) {
        category = ECSTRING(medical,Category_Medical);
        displayName = CSTRING(litterSimulationDetail);
        description = CSTRING(litterSimulationDetail_Description);
        typeName = "SCALAR";

        value = 3;
        values[] = {"Off", "Low", "Medium", "High", "Ultra"};
        _values[] = { 0, 50, 100, 1000, 5000 };
    };
    class GVAR(medical,increaseTrainingInLocations) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(increaseTrainingInLocations_DisplayName);
        description = CSTRING(increaseTrainingInLocations_Description);
        value = 0;
        typeName = "BOOL";
    };
    class EGVAR(medical,PAKTime) {
        category = ECSTRING(medical,Category_Medical);
        displayName = CSTRING(PAKTime);
        description = CSTRING(PAKTime_Description);
        typeName = "SCALAR";
        value = 0;
    };
};
