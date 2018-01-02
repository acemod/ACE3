class ACE_Settings {
    class GVAR(disableNVGsWithSights) {
        category = CSTRING(Category);
        displayName = CSTRING(DisableNVGsWithSights_DisplayName);
        description = CSTRING(DisableNVGsWithSights_description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(fogScaling) {
        category = CSTRING(Category);
        displayName = CSTRING(fogScaling_DisplayName);
        description = CSTRING(fogScaling_Description);
        typeName = "SCALAR";
        value = 1;
        sliderSettings[] = {0, 2, 1, 1};
    };
    class GVAR(effectScaling) {
        category = CSTRING(Category);
        displayName = CSTRING(effectScaling_DisplayName);
        description = CSTRING(effectScaling_Description);
        typeName = "SCALAR";
        value = 1;
        sliderSettings[] = {0, 2, 1, 1};
    };
    class GVAR(aimDownSightsBlur) {
        category = CSTRING(Category);
        displayName = CSTRING(aimDownSightsBlur_DisplayName);
        typeName = "SCALAR";
        value = 1;
        sliderSettings[] = {0, 2, 1, 1};
    };
};
