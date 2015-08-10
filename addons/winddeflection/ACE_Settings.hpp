class ACE_Settings {
    class GVAR(enabled) {
        displayName = CSTRING(deflectionModule_DisplayName);
        description = CSTRING(deflectionModule_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(vehicleEnabled) {
        displayName = CSTRING(vehicleEnabled_DisplayName);
        description = CSTRING(vehicleEnabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(simulationInterval) {
        displayName = CSTRING(simulationInterval_DisplayName);
        description = CSTRING(simulationInterval_Description);
        typeName = "SCALAR";
        value = 0.05;
    };
    class GVAR(simulationRadius) {
        displayName = CSTRING(simulationRadius_DisplayName);
        description = CSTRING(simulationRadius_Description);
        typeName = "SCALAR";
        value = 3000;
    };
};
