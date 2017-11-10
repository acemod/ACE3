class ACE_Settings {
    class GVAR(enabled) {
        displayName = CSTRING(enabled_DisplayName);
        description = CSTRING(enabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(updateInterval) {
        displayName = CSTRING(updateInterval_DisplayName);
        description = CSTRING(updateInterval_Description);
        typeName = "SCALAR";
        value = 60;
    };
    class GVAR(windSimulation) {
        displayName = CSTRING(windSimulation_DisplayName);
        description = CSTRING(windSimulation_Description);
        typeName = "BOOL";
        value = 1;
    };
};
