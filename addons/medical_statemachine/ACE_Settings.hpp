class ACE_Settings {
    class GVAR(fatalInjuryCondition) {
        displayName = CSTRING(fatalInjuryCondition_DisplayName);
        description = CSTRING(fatalInjuryCondition_Description);
        value = 0;
        typeName = "SCALAR";
        values[] = {"Always", "In Cardiac Arrest", "Never"};
    };
    class GVAR(fatalInjuryConditionAI) {
        displayName = CSTRING(fatalInjuryConditionAI_DisplayName);
        description = CSTRING(fatalInjuryConditionAI_Description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(unconsciousConditionAI) {
        displayName = CSTRING(unconsciousConditionAI_DisplayName);
        description = CSTRING(unconsciousConditionAI_Description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(cardiacArrestTime) {
        displayName = CSTRING(cardiacArrestTime_DisplayName);
        description = CSTRING(cardiacArrestTime_Description);
        value = 30;
        typeName = "SCALAR";
        sliderSettings[] = {1, 3600, 30, 0};
    };
};
