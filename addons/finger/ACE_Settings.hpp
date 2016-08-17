class ACE_Settings {
    class GVAR(enabled) {
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(enabled_displayName);
    };
    class GVAR(maxRange) {
        value = 4;
        typeName = "SCALAR";
        displayName = CSTRING(maxRange_displayName);
        description = CSTRING(maxRange_description);
    };
    class GVAR(indicatorForSelf) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(indicatorForSelf_name);
        description = CSTRING(indicatorForSelf_description);
    };
    class GVAR(indicatorColor) {
        value[] = {0.83, 0.68, 0.21, 0.75};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = CSTRING(indicatorColor_name);
        description = CSTRING(indicatorColor_description);
    };
};
