class ACE_Settings {
    class GVAR(level) {
        value = 1;
        typeName = "SCALAR";
        values[] = {"$STR_ACE_MedicalLevel_Disabled", "$STR_ACE_MedicalLevel_Basic", "$STR_ACE_MedicalLevel_Advanced"};
        displayName = "$STR_ACE_MedicalLevel";
        description = "$STR_ACE_MedicalLevel_Desc";
    };
    class GVAR(medicSetting) {
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "Normal", "Advanced"};
        displayName = "$STR_ACE_Medical_medicSetting";
        description = "$STR_ACE_Medical_medicSetting_Desc";
    };
    class GVAR(enableFor) {
        value = 0;
        typeName = "SCALAR";
        values[] = {"Players only", "Players and AI"};
        displayName = "$STR_ACE_enableFor";
        description = "$STR_ACE_enableFor_Desc";
    };
    class GVAR(enableOverdosing) {
        typeName = "BOOL";
        value = 1;
        displayName = "$STR_ACE_enableOverdosing";
        description = "$STR_ACE_enableOverdosing_Desc";
    };
    class GVAR(bleedingCoefficient) {
        typeName = "SCALAR";
        value = 1;
        displayName = "$STR_ACE_bleedingCoefficient";
        description = "$STR_ACE_bleedingCoefficient_Desc";
    };
    // TODO Disabled until the features are implemented    
    /*class GVAR(enableAirway) {
        typeName = "BOOL";
        value = false;
        displayName = "$STR_ACE_enableAirway";
        description = "$STR_ACE_enableAirway_Desc";
    };
    class GVAR(enableFractures) {
        typeName = "BOOL";
        value = false;
        displayName = "$STR_ACE_enableFractures";
        description = "$STR_ACE_enableFractures_Desc";
    };*/
    class GVAR(enableAdvancedWounds) {
        typeName = "BOOL";
        value = false;
        displayName = "$STR_ACE_enableAdvancedWounds";
        description = "$STR_ACE_enableAdvancedWounds_Desc";
    };
    class GVAR(enableVehicleCrashes) {
        typeName = "BOOL";
        value = 1;
        displayName = "$STR_ACE_enableVehicleCrashes";
        description = "$STR_ACE_enableVehicleCrashes_Desc";
    };
    class GVAR(enableScreams) {
        typeName = "BOOL";
        value = 1;
        displayName = "$STR_ACE_enableScreams";
        description = "$STR_ACE_enableScreams_Desc";
    };
    class GVAR(playerDamageThreshold) {
        typeName = "SCALAR";
        value = 1;
        displayName = "$STR_ACE_playerDamageThreshold";
        description = "$STR_ACE_playerDamageThreshold_Desc";
    };
    class GVAR(AIDamageThreshold) {
        typeName = "SCALAR";
        value = 1;
        displayName = "$STR_ACE_AIDamageThreshold";
        description = "$STR_ACE_AIDamageThreshold_Desc";
    };
    class GVAR(enableUnsconsiousnessAI) {
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "Enabled", "50/50"};
        displayName = "$STR_ACE_enableUnsconsiousnessAI";
        description = "$STR_ACE_enableUnsconsiousnessAI_Desc";
    };
    class GVAR(preventInstaDeath) {
        typeName = "BOOL";
        value = 0;
        displayName = "$STR_ACE_Medical_preventInstaDeath";
        description = "$STR_ACE_Medical_preventInstaDeath_Desc";
    };
    class GVAR(maxReviveTime) {
        typeName = "SCALAR";
        value = 120;
        displayName = "$STR_ACE_Medical_maxReviveTime";
        description = "$STR_ACE_Medical_maxReviveTime_Desc";
    };
    class GVAR(amountOfReviveLives) {
        typeName = "SCALAR";
        value = -1;
        displayName = "$STR_ACE_Medical_amountOfReviveLives";
        description = "$STR_ACE_Medical_amountOfReviveLives_Desc";
    };
    //Disabled
    /*class GVAR(allowDeadBodyMovement) {
        typeName = "BOOL";
        value = 0;
        displayName = "$STR_ACE_Medical_allowDeadBodyMovement";
        description = "$STR_ACE_Medical_allowDeadBodyMovement_Desc";
    };*/
    class GVAR(allowLitterCreation) {
        typeName = "BOOL";
        value = true;
        displayName = "$STR_ACE_Medical_allowLitterCreation";
        description = "$STR_ACE_Medical_allowLitterCreation_Desc";
    };
    class GVAR(litterCleanUpDelay) {
        typeName = "SCALAR";
        value = 1800;
        displayName = "$STR_ACE_Medical_litterCleanUpDelay";
        description = "$STR_ACE_Medical_litterCleanUpDelay_Desc";
   };
    class GVAR(medicSetting_PAK) {
        typeName = "SCALAR";
        value = 1;
        values[] = {"Anyone", "Medics only", "Doctors only"};
        displayName = "$STR_ACE_Medical_medicSetting_PAK";
        description = "$STR_ACE_Medical_medicSetting_PAK_Desc";
    };
    class GVAR(medicSetting_SurgicalKit) {
        typeName = "SCALAR";
        value = 1;
        values[] = {"Anyone", "Medics only", "Doctors only"};
        displayName = "$STR_ACE_Medical_medicSetting_SurgicalKit";
        description = "$STR_ACE_Medical_medicSetting_SurgicalKit_Desc";
    };
    class GVAR(consumeItem_PAK) {
        typeName = "SCALAR";
        value = 0;
        values[] = {"No", "Yes"};
        displayName = "$STR_ACE_Medical_consumeItem_PAK";
        description = "$STR_ACE_Medical_consumeItem_PAK_Desc";
    };
    class GVAR(consumeItem_SurgicalKit) {
        typeName = "SCALAR";
        value = 0;
        values[] = {"No", "Yes"};
        displayName = "$STR_ACE_Medical_consumeItem_SurgicalKit";
        description = "$STR_ACE_Medical_consumeItem_SurgicalKit_Desc";
    };
    class GVAR(useLocation_PAK) {
        typeName = "SCALAR";
        value = 3;
        values[] = {"Anywhere", "Medical vehicles", "Medical facility", "vehicle & facility", "Disabled"};
        displayName = "$STR_ACE_Medical_useLocation_PAK";
        description = "$STR_ACE_Medical_useLocation_PAK_Desc";
    };
    class GVAR(useLocation_SurgicalKit) {
        typeName = "SCALAR";
        value = 2;
        values[] = {"Anywhere", "Medical vehicles", "Medical facility", "vehicle & facility", "Disabled"};
        displayName = "$STR_ACE_Medical_useLocation_SurgicalKit";
        description = "$STR_ACE_Medical_useLocation_SurgicalKit_Desc";
    };
    class GVAR(keepLocalSettingsSynced) {
        typeName = "BOOL";
        value = 1;
        displayName = "$STR_ACE_Medical_keepLocalSettingsSynced";
        description = "$STR_ACE_Medical_keepLocalSettingsSynced_Desc";
    };
    class GVAR(healHitPointAfterAdvBandage) {
        typeName = "BOOL";
        value = 1;
        displayName = "$STR_ACE_Medical_healHitPointAfterAdvBandage";
        description = "$STR_ACE_Medical_healHitPointAfterAdvBandage_Desc";
    };
    class GVAR(painEffectType) {
        displayName = "$STR_ACE_Medical_painEffectType";
        description = "$STR_ACE_Medical_painEffectType_Desc";
        typeName = "SCALAR";
        value = 0;
        values[] = {"$STR_ACE_Medical_painEffect_Flash", "$STR_ACE_Medical_painEffect_Chroma"};
        isClientSettable = 1;

    };
    class GVAR(allowUnconsciousAnimationOnTreatment) {
        typeName = "BOOL";
        value = 0;
    };
};
