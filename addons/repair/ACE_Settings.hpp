class ACE_Settings {
    class GVAR(DisplayTextOnRepair) {
        displayName = CSTRING(SettingDisplayTextName);
        description = CSTRING(SettingDisplayTextDesc);
        typeName = "BOOL";
        isClientSettable = 1;
        value = 1;
        category = CSTRING(categoryName);
    };
    class GVAR(engineerSetting_Repair) {
        displayName = CSTRING(enginerSetting_Repair_name);
        description = CSTRING(enginerSetting_Repair_description);
        typeName = "SCALAR";
        value = 1;
        values[] = {CSTRING(engineerSetting_anyone), CSTRING(engineerSetting_EngineerOnly), CSTRING(engineerSetting_RepairSpecialistOnly)};
        category = CSTRING(categoryName);
    };
    class GVAR(engineerSetting_Wheel) {
        displayName = CSTRING(enginerSetting_Wheel_name);
        description = CSTRING(enginerSetting_Wheel_description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(engineerSetting_anyone), CSTRING(engineerSetting_EngineerOnly), CSTRING(engineerSetting_RepairSpecialistOnly)};
        category = CSTRING(categoryName);
    };
    class GVAR(repairDamageThreshold) {
        displayName = CSTRING(repairDamageThreshold_name);
        description = CSTRING(repairDamageThreshold_description);
        typeName = "SCALAR";
        value = 0.6;
        category = CSTRING(categoryName);
    };
    class GVAR(repairDamageThreshold_Engineer) {
        displayName = CSTRING(repairDamageThreshold_Engineer_name);
        description = CSTRING(repairDamageThreshold_Engineer_description);
        typeName = "SCALAR";
        value = 0.4;
        category = CSTRING(categoryName);
    };
    class GVAR(consumeItem_ToolKit) {
        displayName = CSTRING(consumeItem_ToolKit_name);
        description = CSTRING(consumeItem_ToolKit_description);
        typeName = "SCALAR";
        value = 1;
        values[] = {ECSTRING(common,No), ECSTRING(common,Yes)};
        category = CSTRING(categoryName);
    };
    class GVAR(fullRepairLocation) {
        displayName = CSTRING(fullRepairLocation);
        description = CSTRING(fullRepairLocation_description);
        typeName = "SCALAR";
        value = 2;
        values[] = {CSTRING(useAnywhere), CSTRING(repairVehicleOnly), CSTRING(repairFacilityOnly), CSTRING(vehicleAndFacility), ECSTRING(common,Disabled)};
        category = CSTRING(categoryName);
    };
    class GVAR(engineerSetting_fullRepair) {
        displayName = CSTRING(engineerSetting_fullRepair_name);
        description = CSTRING(engineerSetting_fullRepair_description);
        typeName = "SCALAR";
        value = 3;
        values[] = {CSTRING(engineerSetting_anyone), CSTRING(engineerSetting_EngineerOnly), CSTRING(engineerSetting_RepairSpecialistOnly)};
        category = CSTRING(categoryName);
    };
    class GVAR(addSpareParts) {
        displayName = CSTRING(addSpareParts_name);
        description = CSTRING(addSpareParts_description);
        typeName = "BOOL";
        value = 1;
        category = CSTRING(categoryName);
    };
};
