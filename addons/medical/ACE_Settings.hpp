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
    class GVAR(enableVehicleCrashes) {
        movedToSQF = 1; 
    };
    class GVAR(spontaneousWakeUpChance) {
        movedToSQF = 1;
    };
};
