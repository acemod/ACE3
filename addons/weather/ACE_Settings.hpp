class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(enabled_DisplayName);
        description = CSTRING(enabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(updateInterval) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(updateInterval_DisplayName);
        description = CSTRING(updateInterval_Description);
        typeName = "SCALAR";
        value = 60;
        sliderSettings[] = {0, 300, 0, 0};
    };
    class GVAR(windSimulation) {
        category = CSTRING(Module_DisplayName);
        displayName = CSTRING(windSimulation_DisplayName);
        description = CSTRING(windSimulation_Description);
        typeName = "BOOL";
        value = 1;
    };
};
