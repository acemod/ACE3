class ACE_Settings {
    class GVAR(canFingerEachOther) {
        typeName = "BOOL";
        value = 1;
    };    
    class GVAR(maxRange) {
        typeName = "SCALAR";
        value = 4;
    };
    class GVAR(indicatorForSelf) {
        displayName = CSTRING(indicatorForSelf_name);
        description = CSTRING(indicatorForSelf_description);
        isClientSettable = 1;
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(indicatorColor) {
        value[] = {0.83, 0.68, 0.21, 0.75};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = CSTRING(indicatorColor_name);
        description = CSTRING(indicatorColor_description);
    };
};
