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
        value = 1;
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
        //for ref: 3d interaction (MEDICAL_ACTION_DISTANCE) is 1.75
        value = 3;
        typeName = "SCALAR";
        category = ECSTRING(medical,Category_Medical);
        sliderSettings[] = {0, 10, 3, 1};
    };
    class EGVAR(medical,menuTypeStyle) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(menuTypeDisplay);
        description = CSTRING(menuTypeDescription);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(useSelection), CSTRING(useRadial), "Disabled"};
        isClientSettable = 1;
    };
    class GVAR(painVisualization) {
        displayName = CSTRING(painVisualization_DisplayName);
        description = CSTRING(painVisualization_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"Anyone", "Medics only", "Doctors only"};
    };
    class GVAR(showPainInMenu) {
        displayName = CSTRING(showPainInMenu_DisplayName);
        description = CSTRING(showPainInMenu_Description);
        typeName = "BOOL";
        value = 0;
    };
};
