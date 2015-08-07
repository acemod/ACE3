class ACE_Settings {
    class GVAR(level) {
        category = "medical";
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "Basic", "Advanced"};
    };
    class GVAR(medicSetting) {
        category = "medical";
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "Normal", "Advanced"};
    };
    class GVAR(enableFor) {
        category = "medical";
        value = 0;
        typeName = "SCALAR";
        values[] = {"Players only", "Players and AI"};
    };
    class GVAR(enableOverdosing) {
        category = "medical";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(bleedingCoefficient) {
        category = "medical";
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(painCoefficient) {
        category = "medical";
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(enableAirway) {
        category = "medical";
        typeName = "BOOL";
        value = false;
    };
    class GVAR(enableFractures) {
        category = "medical";
        typeName = "BOOL";
        value = false;
    };
    class GVAR(enableAdvancedWounds) {
        category = "medical";
        typeName = "BOOL";
        value = false;
    };
    class GVAR(enableVehicleCrashes) {
        category = "medical";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(enableScreams) {
        category = "medical";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(playerDamageThreshold) {
        category = "medical";
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(AIDamageThreshold) {
        category = "medical";
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(enableUnconsciousnessAI) {
        category = "medical";
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "50/50", "Enabled"};
    };
    class GVAR(remoteControlledAI) {
        category = "medical";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(preventInstaDeath) {
        category = "medical";
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(enableRevive) {
        category = "medical";
        typeName = "SCALAR";
        value = 0;
        values[] = {"Disabled", "Players only", "Players and AI"};
    };
    class GVAR(maxReviveTime) {
        category = "medical";
        typeName = "SCALAR";
        value = 120;
    };
    class GVAR(amountOfReviveLives) {
        category = "medical";
        typeName = "SCALAR";
        value = -1;
    };
    class GVAR(allowDeadBodyMovement) {
        category = "medical";
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(allowLitterCreation) {
        category = "medical";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(litterSimulationDetail) {
        category = "medical";
        displayName = CSTRING(litterSimulationDetail);
        description = CSTRING(litterSimulationDetail_Desc);
        typeName = "SCALAR";

        value = 3;
        values[] = {"Off", "Low", "Medium", "High", "Ultra"};
        _values[] = { 0, 50, 100, 1000, 5000 };

        isClientSettable = 1;
    };
    class GVAR(litterCleanUpDelay) {
        category = "medical";
        typeName = "SCALAR";
        value = 0;
    };
    class GVAR(medicSetting_PAK) {
        category = "medical";
        typeName = "SCALAR";
        value = 1;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(medicSetting_SurgicalKit) {
        category = "medical";
        typeName = "SCALAR";
        value = 1;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(consumeItem_PAK) {
        category = "medical";
        typeName = "SCALAR";
        value = 0;
        values[] = {"No", "Yes"};
    };
    class GVAR(consumeItem_SurgicalKit) {
        category = "medical";
        typeName = "SCALAR";
        value = 0;
        values[] = {"No", "Yes"};
    };
    class GVAR(useLocation_PAK) {
        category = "medical";
        typeName = "SCALAR";
        value = 3;
        values[] = {"Anywhere", "Medical vehicles", "Medical facility", "vehicle & facility", "Disabled"};
    };
    class GVAR(useLocation_SurgicalKit) {
        category = "medical";
        typeName = "SCALAR";
        value = 2;
        values[] = {"Anywhere", "Medical vehicles", "Medical facility", "vehicle & facility", "Disabled"};
    };
    class GVAR(useCondition_PAK) {
        category = "medical";
        displayName = CSTRING(AdvancedMedicalSettings_useCondition_PAK_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_useCondition_PAK_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anytime", "Stable"};
    };
    class GVAR(useCondition_SurgicalKit) {
        category = "medical";
        displayName = CSTRING(AdvancedMedicalSettings_useCondition_SurgicalKit_DisplayName);
        description = CSTRING(AdvancedMedicalSettings_useCondition_SurgicalKit_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anytime", "Stable"};
    };
    class GVAR(keepLocalSettingsSynced) {
        category = "medical";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(healHitPointAfterAdvBandage) {
        category = "medical";
        displayName = CSTRING(healHitPointAfterAdvBandage);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(painIsOnlySuppressed) {
        category = "medical";
        displayName = CSTRING(painIsOnlySuppressed);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(painEffectType) {
        category = "medical";
        displayName = CSTRING(painEffectType);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(painEffect_Flash), CSTRING(painEffect_Chroma)};
        isClientSettable = 1;
    };
    class GVAR(allowUnconsciousAnimationOnTreatment) {
        category = "medical";
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(moveUnitsFromGroupOnUnconscious) {
        category = "medical";
        typeName = "BOOL";
        value = 0;
    };

    class GVAR(menuTypeStyle) {
        category = "medical";
        displayName = CSTRING(menuTypeDisplay);
        description = CSTRING(menuTypeDescription);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(useSelection)/*, CSTRING(useRadial)*/};
        // isClientSettable = 1;
    };
};
