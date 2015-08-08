class ACE_Settings {
    class GVAR(level) {
        category = LSTRING(Category_Medical);
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "Basic", "Advanced"};
    };
    class GVAR(medicSetting) {
        category = LSTRING(Category_Medical);
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "Normal", "Advanced"};
    };
    class GVAR(enableFor) {
        category = LSTRING(Category_Medical);
        value = 0;
        typeName = "SCALAR";
        values[] = {"Players only", "Players and AI"};
    };
    class GVAR(enableOverdosing) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(bleedingCoefficient) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(painCoefficient) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(enableAirway) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = false;
    };
    class GVAR(enableFractures) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = false;
    };
    class GVAR(enableAdvancedWounds) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = false;
    };
    class GVAR(enableVehicleCrashes) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(enableScreams) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(playerDamageThreshold) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(AIDamageThreshold) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(enableUnconsciousnessAI) {
        category = LSTRING(Category_Medical);
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "50/50", "Enabled"};
    };
    class GVAR(remoteControlledAI) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(preventInstaDeath) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(enableRevive) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Disabled", "Players only", "Players and AI"};
    };
    class GVAR(maxReviveTime) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 120;
    };
    class GVAR(amountOfReviveLives) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = -1;
    };
    class GVAR(allowDeadBodyMovement) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(allowLitterCreation) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(litterSimulationDetail) {
        category = LSTRING(Category_Medical);
        displayName = CSTRING(litterSimulationDetail);
        description = CSTRING(litterSimulationDetail_Desc);
        typeName = "SCALAR";

        value = 3;
        values[] = {"Off", "Low", "Medium", "High", "Ultra"};
        _values[] = { 0, 50, 100, 1000, 5000 };

        isClientSettable = 1;
    };
    class GVAR(litterCleanUpDelay) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 0;
    };
    class GVAR(medicSetting_PAK) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 1;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(medicSetting_SurgicalKit) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 1;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(consumeItem_PAK) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 0;
        values[] = {"No", "Yes"};
    };
    class GVAR(consumeItem_SurgicalKit) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 0;
        values[] = {"No", "Yes"};
    };
    class GVAR(useLocation_PAK) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 3;
        values[] = {"Anywhere", "Medical vehicles", "Medical facility", "vehicle & facility", "Disabled"};
    };
    class GVAR(useLocation_SurgicalKit) {
        category = LSTRING(Category_Medical);
        typeName = "SCALAR";
        value = 2;
        values[] = {"Anywhere", "Medical vehicles", "Medical facility", "vehicle & facility", "Disabled"};
    };
    class GVAR(useCondition_PAK) {
        category = LSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_useCondition_PAK_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_useCondition_PAK_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anytime", "Stable"};
    };
    class GVAR(useCondition_SurgicalKit) {
        category = LSTRING(Category_Medical);
        displayName = CSTRING(AdvancedMedicalSettings_useCondition_SurgicalKit_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_useCondition_SurgicalKit_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anytime", "Stable"};
    };
    class GVAR(keepLocalSettingsSynced) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(healHitPointAfterAdvBandage) {
        category = LSTRING(Category_Medical);
        displayName = CSTRING(healHitPointAfterAdvBandage);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(painIsOnlySuppressed) {
        category = LSTRING(Category_Medical);
        displayName = CSTRING(painIsOnlySuppressed);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(painEffectType) {
        category = LSTRING(Category_Medical);
        displayName = CSTRING(painEffectType);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(painEffect_Flash), CSTRING(painEffect_Chroma)};
        isClientSettable = 1;
    };
    class GVAR(allowUnconsciousAnimationOnTreatment) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(moveUnitsFromGroupOnUnconscious) {
        category = LSTRING(Category_Medical);
        typeName = "BOOL";
        value = 0;
    };

    class GVAR(menuTypeStyle) {
        category = LSTRING(Category_Medical);
        displayName = CSTRING(menuTypeDisplay);
        description = CSTRING(menuTypeDescription);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(useSelection)/*, CSTRING(useRadial)*/};
        // isClientSettable = 1;
    };
};
