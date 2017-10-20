class ACE_Settings {
    class GVAR(disableNVGsWithSights) {
        displayName = CSTRING(DisableNVGsWithSights_DisplayName);
        description = CSTRING(DisableNVGsWithSights_description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(fogScaling) {
        displayName = CSTRING(fogScaling_DisplayName);
        description = CSTRING(fogScaling_Description);
        typeName = "SCALAR";
        value = 1;
    };
    class GVAR(effectScaling) {
        displayName = CSTRING(effectScaling_DisplayName);
        description = CSTRING(effectScaling_Description);
        typeName = "SCALAR";
        value = 1;
    };
};
