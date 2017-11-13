class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(windDeflection_DisplayName);
        displayName = CSTRING(deflectionModule_DisplayName);
        description = CSTRING(deflectionModule_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(vehicleEnabled) {
        category = CSTRING(windDeflection_DisplayName);
        displayName = CSTRING(vehicleEnabled_DisplayName);
        description = CSTRING(vehicleEnabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(simulationInterval) {
        category = CSTRING(windDeflection_DisplayName);
        displayName = CSTRING(simulationInterval_DisplayName);
        description = CSTRING(simulationInterval_Description);
        typeName = "SCALAR";
        value = 0.05;
        sliderSettings[] = {0, 0.2, 0.05, 1};
    };
    class GVAR(simulationRadius) {
        category = CSTRING(windDeflection_DisplayName);
        displayName = CSTRING(simulationRadius_DisplayName);
        description = CSTRING(simulationRadius_Description);
        typeName = "SCALAR";
        value = 3000;
        sliderSettings[] = {0, 3000, 3000, 0};
    };
};
