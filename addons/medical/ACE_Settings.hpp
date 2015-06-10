class ACE_Settings {
    class GVAR(level) {
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "Basic", "Advanced"};
    };
    class GVAR(medicSetting) {
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "Normal", "Advanced"};
    };
    class GVAR(enableFor) {
        value = 0;
        typeName = "SCALAR";
        values[] = {"Players only", "Players and AI"};
    };
    class GVAR(enableOverdosing) {
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(bleedingCoefficient) {
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(painCoefficient) {
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(enableAirway) {
        typeName = "BOOL";
        value = false;
    };
    class GVAR(enableFractures) {
        typeName = "BOOL";
        value = false;
    };
    class GVAR(enableAdvancedWounds) {
        typeName = "BOOL";
        value = false;
    };
    class GVAR(enableVehicleCrashes) {
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(enableScreams) {
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(playerDamageThreshold) {
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(AIDamageThreshold) {
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(enableUnconsciousnessAI) {
        value = 1;
        typeName = "SCALAR";
        values[] = {"Disabled", "50/50", "Enabled"};
    };
    class GVAR(preventInstaDeath) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(enableRevive) {
        typeName = "SCALAR";
        value = 0;
        values[] = {"Disabled", "Players only", "Players and AI"};
    };
    class GVAR(maxReviveTime) {
        typeName = "SCALAR";
        value = 120;
    };
    class GVAR(amountOfReviveLives) {
        typeName = "SCALAR";
        value = -1;
    };
    class GVAR(allowDeadBodyMovement) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(allowLitterCreation) {
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(litterSimulationDetail) {
        displayName = CSTRING(litterSimulationDetail);
        description = CSTRING(litterSimulationDetail_Desc);
        typeName = "SCALAR";

        value = 3;
        values[] = {"Off", "Low", "Medium", "High", "Ultra"};
        _values[] = { 0, 50, 100, 1000, 5000 };

        isClientSettable = 1;
    };
    class GVAR(litterCleanUpDelay) {
        typeName = "SCALAR";
        value = 0;
    };
    class GVAR(medicSetting_PAK) {
        typeName = "SCALAR";
        value = 1;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(medicSetting_SurgicalKit) {
        typeName = "SCALAR";
        value = 1;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(consumeItem_PAK) {
        typeName = "SCALAR";
        value = 0;
        values[] = {"No", "Yes"};
    };
    class GVAR(consumeItem_SurgicalKit) {
        typeName = "SCALAR";
        value = 0;
        values[] = {"No", "Yes"};
    };
    class GVAR(useLocation_PAK) {
        typeName = "SCALAR";
        value = 3;
        values[] = {"Anywhere", "Medical vehicles", "Medical facility", "vehicle & facility", "Disabled"};
    };
    class GVAR(useLocation_SurgicalKit) {
        typeName = "SCALAR";
        value = 2;
        values[] = {"Anywhere", "Medical vehicles", "Medical facility", "vehicle & facility", "Disabled"};
    };
    class GVAR(keepLocalSettingsSynced) {
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(healHitPointAfterAdvBandage) {
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(painEffectType) {
        displayName = CSTRING(painEffectType);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(painEffect_Flash), CSTRING(painEffect_Chroma)};
        isClientSettable = 1;
    };
    class GVAR(allowUnconsciousAnimationOnTreatment) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(moveUnitsFromGroupOnUnconscious) {
        typeName = "BOOL";
        value = 0;
    };

    class GVAR(menuTypeStyle) {
        displayName = CSTRING(menuTypeDisplay);
        description = CSTRING(menuTypeDescription);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(useSelection)/*, CSTRING(useRadial)*/};
        // isClientSettable = 1;
    };
};
