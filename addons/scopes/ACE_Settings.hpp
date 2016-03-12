class ACE_Settings {
    class GVAR(enabled) {
        typeName = "BOOL";
        value = 1;
        displayName = CSTRING(Enabled_displayName);
        description = CSTRING(Enabled_description);
    };
    class GVAR(defaultZeroDistance) {
        typeName = "SCALAR";
        value = 100;
        displayName = CSTRING(defaultZeroDistance_displayName);
        description = CSTRING(defaultZeroDistance_description);
    };
};
