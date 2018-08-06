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
    class GVAR(spontaneousWakeUpChance) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(MedicalSettings_spontaneousWakeUpChance_DisplayName);
        description = CSTRING(MedicalSettings_spontaneousWakeUpChance_Description);
        typeName = "SCALAR";
        value = 0.05;
        sliderSettings[] = {0, 1, 0.05, 2};
    };
};
