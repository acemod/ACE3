class ACE_Settings {
    class GVAR(DisplayTextOnRepair) {
        typeName = "BOOL";
        isClientSetable = 1;
        value = 1;
        displayName = "$STR_ACE_Repair_SettingDisplayTextName";
        description = "$STR_ACE_Repair_SettingDisplayTextDesc";
    };
    class GVAR(engineerSetting_Repair) {
        typeName = "SCALAR";
        value = 1;
        values[] = {"Anyone", "Engineer only", "Repair Specialist only"};
    };
    class GVAR(engineerSetting_Wheel) {
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anyone", "Engineer only", "Repair Specialist only"};
    };
    class GVAR(consumeItem_ToolKit) {
        typeName = "SCALAR";
        value = 1;
        values[] = {"No", "Yes"};
    };
    class GVAR(repairDamageThreshold) {
        typeName = "SCALAR";
        value = 0;
    };
    class GVAR(repairDamageThreshold_Engineer) {
        typeName = "SCALAR";
        value = 0;
    };
};
