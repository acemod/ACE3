class ACE_Settings {
    class GVAR(allow) {
        displayName = CSTRING(allow);
        description = CSTRING(allow_Descr);
        value = 1;
        typeName = "SCALAR";
        values[] = {ECSTRING(common,Disabled), ECSTRING(common,Enabled), ECSTRING(common,VehiclesOnly)};
        category = ECSTRING(medical,Category_Medical);
    };
    class GVAR(useMenu) {
        displayName = CSTRING(useMenu);
        description = CSTRING(useMenu_Descr);
        value = 0;
        typeName = "SCALAR";
        values[] = {ECSTRING(common,Disabled), ECSTRING(common,Enabled), ECSTRING(common,VehiclesOnly)};
        isClientSettable = 1;
        category = ECSTRING(medical,Category_Medical);
    };
    class GVAR(openAfterTreatment) {
        displayName = CSTRING(openAfterTreatment);
        description = CSTRING(openAfterTreatment_Descr);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
        category = ECSTRING(medical,Category_Medical);
    };
    class GVAR(maxRange) {
        displayName = CSTRING(maxRange);
        description = CSTRING(maxRange_Descr);
        //for ref: 3d interaction (MEDICAL_ACTION_DISTANCE) is 1.75
        value = 3;
        typeName = "SCALAR";
        category = ECSTRING(medical,Category_Medical);
        sliderSettings[] = {0, 10, 3, 1};
    };
};
