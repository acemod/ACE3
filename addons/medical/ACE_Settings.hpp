class ACE_Settings {
    class GVAR(medicSetting) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_medicSetting_DisplayName);
        description = CSTRING(MedicalSettings_medicSetting_Description);
        value = 0;
        typeName = "SCALAR";
        values[] = {"Disabled", "Normal", "Advanced"};
    };
    class GVAR(increaseTrainingInLocations) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_increaseTrainingInLocations_DisplayName);
        description = CSTRING(MedicalSettings_increaseTrainingInLocations_Description);
        value = 0;
        typeName = "BOOL";
    };
    /* @todo
    class GVAR(enableFor) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_enableFor_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_enableFor_Description);
        value = 1;
        typeName = "SCALAR";
        values[] = {"Players only", "Players and AI"};
    };
    */
    class GVAR(bleedingCoefficient) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_bleedingCoefficient_DisplayName);
        description = CSTRING(MedicalSettings_bleedingCoefficient_Description);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(painCoefficient) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_painCoefficient_DisplayName);
        description = CSTRING(MedicalSettings_painCoefficient_Description);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(advancedBandages) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_advancedBandages_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_advancedBandages_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(advancedMedication) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_advancedMedication_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_advancedMedication_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(woundReopening) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_enableAdvancedWounds_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_enableAdvancedWounds_Description);
        typeName = "BOOL";
        value = 1;
    };
    /* @todo
    class GVAR(enableVehicleCrashes) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_enableVehicleCrashes_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_enableVehicleCrashes_Description);
        typeName = "BOOL";
        value = 1;
    };
    */
    class GVAR(enableScreams) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_enableScreams_DisplayName);
        description = CSTRING(MedicalSettings_enableScreams_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(showPainInMenu) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_showPainInMenu_DisplayName);
        description = CSTRING(MedicalSettings_showPainInMenu_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(playerDamageThreshold) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_playerDamageThreshold_DisplayName);
        description = CSTRING(MedicalSettings_playerDamageThreshold_Description);
        typeName = "SCALAR";
        value = 1.05;
    };
    class GVAR(AIDamageThreshold) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_AIDamageThreshold_DisplayName);
        description = CSTRING(MedicalSettings_AIDamageThreshold_Description);
        typeName = "SCALAR";
        value = 1.05;
    };
    class GVAR(fatalInjuryCondition) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_fatalInjuryCondition_DisplayName);
        description = CSTRING(MedicalSettings_fatalInjuryCondition_Description);
        value = 0;
        typeName = "SCALAR";
        values[] = {"Always", "In Cardiac Arrest", "Never"};
    };
    class GVAR(cardiacArrestTime) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_cardiacArrestTime_DisplayName);
        description = CSTRING(MedicalSettings_cardiacArrestTime_Description);
        value = 30;
        typeName = "SCALAR";
    };
    class GVAR(medicSetting_Epi) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(BasicMedicalSettings_medicSetting_Epi_DisplayName);
        description = CSTRING(BasicMedicalSettings_medicSetting_Epi_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(medicSetting_Medkit) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_medicSetting_Medkit_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_medicSetting_Medkit_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(medicSetting_PAK) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_medicSetting_PAK_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_medicSetting_PAK_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(medicSetting_SurgicalKit) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_medicSetting_SurgicalKit_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_medicSetting_SurgicalKit_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(consumeItem_Medkit) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_consumeItem_Medkit_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_consumeItem_Medkit_Description);
        typeName = "SCALAR";
        value = 1;
        values[] = {"No", "Yes"};
    };
    class GVAR(consumeItem_PAK) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_consumeItem_PAK_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_consumeItem_PAK_Description);
        typeName = "SCALAR";
        value = 1;
        values[] = {"No", "Yes"};
    };
    class GVAR(consumeItem_SurgicalKit) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_consumeItem_SurgicalKit_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_consumeItem_SurgicalKit_Description);
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
        values[] = {CSTRING(AdvancedMedicalSettings_anywhere), CSTRING(AdvancedMedicalSettings_vehicle), CSTRING(AdvancedMedicalSettings_facility), CSTRING(AdvancedMedicalSettings_vehicleAndFacility), ECSTRING(common,Disabled)};
    };
    class GVAR(useLocation_Medkit) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_useLocation_Medkit_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_useLocation_Medkit_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(AdvancedMedicalSettings_anywhere), CSTRING(AdvancedMedicalSettings_vehicle), CSTRING(AdvancedMedicalSettings_facility), CSTRING(AdvancedMedicalSettings_vehicleAndFacility), ECSTRING(common,Disabled)};
    };
    class GVAR(useLocation_PAK) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_useLocation_PAK_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_useLocation_PAK_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(AdvancedMedicalSettings_anywhere), CSTRING(AdvancedMedicalSettings_vehicle), CSTRING(AdvancedMedicalSettings_facility), CSTRING(AdvancedMedicalSettings_vehicleAndFacility), ECSTRING(common,Disabled)};
    };
    class GVAR(useLocation_SurgicalKit) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_useLocation_SurgicalKit_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_useLocation_SurgicalKit_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(AdvancedMedicalSettings_anywhere), CSTRING(AdvancedMedicalSettings_vehicle), CSTRING(AdvancedMedicalSettings_facility), CSTRING(AdvancedMedicalSettings_vehicleAndFacility), ECSTRING(common,Disabled)};
    };
    class GVAR(remainingDamage_Medkit) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_remainingDamage_Medkit_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_remainingDamage_Medkit_Description);
        typeName = "SCALAR";
        value = 0.1;
    };
    class GVAR(painEffectType) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(painEffectType);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(painEffect_Flash), CSTRING(painEffect_Chroma)};
        isClientSettable = 1;
    };
    class GVAR(allowUnconsciousAnimationOnTreatment) {
        category = CSTRING(Category_Medical);
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
};
