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
        movedToSQF = 1;
    };
};
