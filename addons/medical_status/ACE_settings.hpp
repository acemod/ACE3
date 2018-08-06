class ACE_Settings {
    class EGVAR(medical,bleedingCoefficient) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(bleedingCoefficient_DisplayName);
        description = CSTRING(bleedingCoefficient_Description);
        typeName = "SCALAR";
        value = 1;
        sliderSettings[] = {0, 25, 1, 1};
    };
    class EGVAR(medical,painCoefficient) {
        category = CSTRING(Category_Medical);
        displayName = CSTRING(painCoefficient_DisplayName);
        description = CSTRING(painCoefficient_Description);
        typeName = "SCALAR";
        value = 1;
        sliderSettings[] = {0, 25, 1, 1};
    };
    class GVAR(ivFlowRate) {
        displayName = CSTRING(ivFlowRate_DisplayName);
        description = CSTRING(ivFlowRate_Description);
        typeName = "SCALAR";
        value = 1;
    };
};
