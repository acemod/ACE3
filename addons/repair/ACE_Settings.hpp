class ACE_Settings {
    class GVAR(DisplayTextOnRepair) {
        displayName = CSTRING(SettingDisplayTextName);
        description = CSTRING(SettingDisplayTextDesc);
        typeName = "BOOL";
        isClientSetable = 1;
        value = 1;
    };
    class GVAR(engineerSetting_Repair) {
        displayName = CSTRING(enginerSetting_Repair_name);
        description = CSTRING(enginerSetting_Repair_description);
        typeName = "SCALAR";
        value = 1;
        values[] = {CSTRING(engineerSetting_anyone), CSTRING(engineerSetting_EngineerOnly), CSTRING(engineerSetting_RepairSpecialistOnly)};
    };
    class GVAR(engineerSetting_Wheel) {
        displayName = CSTRING(enginerSetting_Wheel_name);
        description = CSTRING(enginerSetting_Wheel_description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(engineerSetting_anyone), CSTRING(engineerSetting_EngineerOnly), CSTRING(engineerSetting_RepairSpecialistOnly)};
    };
    class GVAR(repairDamageThreshold) {
        displayName = CSTRING(repairDamageThreshold_name);
        description = CSTRING(repairDamageThreshold_description);
        typeName = "SCALAR";
        value = 0;
    };
    class GVAR(repairDamageThreshold_Engineer) {
        displayName = CSTRING(repairDamageThreshold_Engineer_name);
        description = CSTRING(repairDamageThreshold_Engineer_description);
        typeName = "SCALAR";
        value = 0;
    };
    class GVAR(consumeItem_ToolKit) {
        displayName = CSTRING(consumeItem_ToolKit_name);
        description = CSTRING(consumeItem_ToolKit_description);
        typeName = "SCALAR";
        value = 1;
        values[] = {ECSTRING(common,No), ECSTRING(common,Yes)};
    };
};
