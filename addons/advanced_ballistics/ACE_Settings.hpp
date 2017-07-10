class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(enabled_DisplayName);
        description = CSTRING(enabled_Description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(simulateForSnipers) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(simulateForSnipers_DisplayName);
        description = CSTRING(simulateForSnipers_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(simulateForGroupMembers) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(simulateForGroupMembers_DisplayName);
        description = CSTRING(simulateForGroupMembers_Description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(simulateForEveryone) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(simulateForEveryone_DisplayName);
        description = CSTRING(simulateForEveryone_Description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(disabledInFullAutoMode) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(disabledInFullAutoMod_DisplayName);
        description = CSTRING(disabledInFullAutoMod_Description);
        typeName = "BOOL";
        value = 0;
    };
    /* // TODO: We currently do not have firedEHs on vehicles
    class GVAR(vehicleGunnerEnabled) {
        category = CSTRING(DisplayName);
        displayName = "Enabled For Vehicle Gunners";
        description = "Enables advanced ballistics for vehicle gunners";
        typeName = "BOOL";
        value = 0;
    };
    */
    class GVAR(ammoTemperatureEnabled) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(ammoTemperatureEnabled_DisplayName);
        description = CSTRING(ammoTemperatureEnabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(barrelLengthInfluenceEnabled) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(barrelLengthInfluenceEnabled_DisplayName);
        description = CSTRING(barrelLengthInfluenceEnabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(bulletTraceEnabled) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(bulletTraceEnabled_DisplayName);
        description = CSTRING(bulletTraceEnabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(simulationInterval) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(simulationInterval_DisplayName);
        description = CSTRING(simulationInterval_Description);
        typeName = "SCALAR";
        value = 0.05;
    };
    class GVAR(simulationRadius) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(simulationRadius_DisplayName);
        description = CSTRING(simulationRadius_Description);
        typeName = "SCALAR";
        value = 3000;
    };
};
