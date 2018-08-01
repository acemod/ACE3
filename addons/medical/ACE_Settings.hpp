class ACE_Settings {
    /* @todo
    class GVAR(enableFor) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_enableFor_DisplayName);
        description = CSTRING(MedicalSettings_enableFor_Description);
        value = 1;
        typeName = "SCALAR";
        values[] = {"Players only", "Players and AI"};
    };
    */
    /* @todo
    class GVAR(enableVehicleCrashes) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_enableVehicleCrashes_DisplayName);
        description = CSTRING(MedicalSettings_enableVehicleCrashes_Description);
        typeName = "BOOL";
        value = 1;
    };
    */
    class GVAR(medicSetting_PainVisualization) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_medicSetting_PainVisualization_DisplayName);
        description = CSTRING(MedicalSettings_medicSetting_PainVisualization_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(medicSetting_Epi) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_medicSetting_Epi_DisplayName);
        description = CSTRING(MedicalSettings_medicSetting_Epi_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(medicSetting_PAK) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_medicSetting_PAK_DisplayName);
        description = CSTRING(MedicalSettings_medicSetting_PAK_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(medicSetting_SurgicalKit) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_medicSetting_SurgicalKit_DisplayName);
        description = CSTRING(MedicalSettings_medicSetting_SurgicalKit_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(consumeItem_PAK) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_consumeItem_PAK_DisplayName);
        description = CSTRING(MedicalSettings_consumeItem_PAK_Description);
        typeName = "SCALAR";
        value = 1;
        values[] = {"No", "Yes"};
    };
    class GVAR(consumeItem_SurgicalKit) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_consumeItem_SurgicalKit_DisplayName);
        description = CSTRING(MedicalSettings_consumeItem_SurgicalKit_Description);
        typeName = "SCALAR";
        value = 1;
        values[] = {"No", "Yes"};
    };
    class GVAR(useLocation_Epi) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(BasicMedicalSettings_useLocation_Epi_DisplayName);
        description = CSTRING(BasicMedicalSettings_useLocation_Epi_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {ECSTRING(common,Anywhere), ECSTRING(common,Vehicle), CSTRING(MedicalSettings_facility), CSTRING(MedicalSettings_vehicleAndFacility), ECSTRING(common,Disabled)};
    };
    class GVAR(useLocation_PAK) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_useLocation_PAK_DisplayName);
        description = CSTRING(MedicalSettings_useLocation_PAK_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {ECSTRING(common,Anywhere), ECSTRING(common,Vehicle), CSTRING(MedicalSettings_facility), CSTRING(MedicalSettings_vehicleAndFacility), ECSTRING(common,Disabled)};
    };
    class GVAR(useLocation_SurgicalKit) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_useLocation_SurgicalKit_DisplayName);
        description = CSTRING(MedicalSettings_useLocation_SurgicalKit_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {ECSTRING(common,Anywhere), ECSTRING(common,Vehicle), CSTRING(MedicalSettings_facility), CSTRING(MedicalSettings_vehicleAndFacility), ECSTRING(common,Disabled)};
    };
    class GVAR(allowUnconsciousAnimationOnTreatment) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_allowUnconsciousAnimationOnTreatment_DisplayName);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(menuTypeStyle) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(menuTypeDisplay);
        description = CSTRING(menuTypeDescription);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(useSelection), CSTRING(useRadial), "Disabled"};
        isClientSettable = 1;
    };
    class GVAR(ivFlowRate) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_ivFlowRate_DisplayName);
        description = CSTRING(MedicalSettings_ivFlowRate_Description);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(allowSelfIV) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_allowSelfIV_DisplayName);
        description = CSTRING(MedicalSettings_allowSelfIV_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"No", "Yes"};
    };
    class GVAR(spontaneousWakeUpChance) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_spontaneousWakeUpChance_DisplayName);
        description = CSTRING(MedicalSettings_spontaneousWakeUpChance_Description);
        typeName = "SCALAR";
        value = 0.05;
        sliderSettings[] = {0, 1, 0.05, 2};
    };
};
