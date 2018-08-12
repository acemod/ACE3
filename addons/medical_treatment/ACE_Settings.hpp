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
    class EGVAR(medical,increaseTrainingInLocations) {
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
    class GVAR(woundReopening) {
        displayName = CSTRING(woundReopening_DisplayName);
        description = CSTRING(woundReopening_Description);
        typeName = "BOOL";
        value = 1;
    };
    class EGVAR(medical,medicSetting_Epi) {
        displayName = CSTRING(medicSetting_Epi_DisplayName);
        description = CSTRING(medicSetting_Epi_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(anyone), CSTRING(medicsOnly), CSTRING(doctorsOnly)};
    };
    class EGVAR(medical,medicSetting_PAK) {
        displayName = CSTRING(medicSetting_PAK_DisplayName);
        description = CSTRING(medicSetting_PAK_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(anyone), CSTRING(medicsOnly), CSTRING(doctorsOnly)};
    };
    class EGVAR(medical,medicSetting_SurgicalKit) {
        displayName = CSTRING(medicSetting_SurgicalKit_DisplayName);
        description = CSTRING(medicSetting_SurgicalKit_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(anyone), CSTRING(medicsOnly), CSTRING(doctorsOnly)};
    };
    class EGVAR(medical,consumeItem_PAK) {
        displayName = CSTRING(consumeItem_PAK_DisplayName);
        description = CSTRING(consumeItem_PAK_Description);
        typeName = "SCALAR";
        value = 1;
        values[] = {"No", "Yes"};
    };
    class EGVAR(medical,consumeItem_SurgicalKit) {
        displayName = CSTRING(consumeItem_SurgicalKit_DisplayName);
        description = CSTRING(consumeItem_SurgicalKit_Description);
        typeName = "SCALAR";
        value = 1;
        values[] = {"No", "Yes"};
    };
    class EGVAR(medical,useLocation_Epi) {
        displayName = CSTRING(useLocation_Epi_DisplayName);
        description = CSTRING(useLocation_Epi_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {ECSTRING(common,Anywhere), ECSTRING(common,Vehicle), CSTRING(medicalFacility), CSTRING(vehicleAndFacility), ECSTRING(common,Disabled)};
    };
    class EGVAR(medical,useLocation_PAK) {
        displayName = CSTRING(useLocation_PAK_DisplayName);
        description = CSTRING(useLocation_PAK_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {ECSTRING(common,Anywhere), ECSTRING(common,Vehicle), CSTRING(medicalFacility), CSTRING(vehicleAndFacility), ECSTRING(common,Disabled)};
    };
    class EGVAR(medical,useLocation_SurgicalKit) {
        displayName = CSTRING(useLocation_SurgicalKit_DisplayName);
        description = CSTRING(useLocation_SurgicalKit_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {ECSTRING(common,Anywhere), ECSTRING(common,Vehicle), CSTRING(medicalFacility), CSTRING(vehicleAndFacility), ECSTRING(common,Disabled)};
    };
    class GVAR(allowSelfIV) {
        displayName = CSTRING(allowSelfIV_DisplayName);
        description = CSTRING(allowSelfIV_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"No", "Yes"};
    };
};
