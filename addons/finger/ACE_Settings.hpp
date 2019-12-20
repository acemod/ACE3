class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(DisplayName);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(enabled_displayName);
        description = CSTRING(enabled_description);
    };
    class GVAR(maxRange) {
        category = CSTRING(DisplayName);
        value = 4;
        typeName = "SCALAR";
        displayName = CSTRING(maxRange_displayName);
        description = CSTRING(maxRange_description);
        sliderSettings[] = {0, 50, 4, 1};
    };
    class GVAR(indicatorForSelf) {
        category = CSTRING(DisplayName);
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(indicatorForSelf_name);
        description = CSTRING(indicatorForSelf_description);
    };
    class GVAR(indicatorColor) {
        category = CSTRING(DisplayName);
        value[] = {0.83, 0.68, 0.21, 0.75};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = CSTRING(indicatorColor_name);
        description = CSTRING(indicatorColor_description);
    };
};
