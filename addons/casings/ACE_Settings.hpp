class ACE_Settings {
    class GVAR(enabled) {
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(enabled_displayName);
        description = CSTRING(enabled_description);
    };
    class GVAR(maxCasings) {
        typeName = "SCALAR";
        value = 200;
        displayName = CSTRING(maxCasings_displayName);
        description = CSTRING(maxCasings_description);
    };
};
