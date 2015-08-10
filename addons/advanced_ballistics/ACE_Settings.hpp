class ACE_Settings {
    class GVAR(enabled) {
        displayName = CSTRING(enabled_DisplayName);
        description = CSTRING(enabled_Description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(simulateForSnipers) {
        displayName = CSTRING(simulateForSnipers_DisplayName);
        description = CSTRING(simulateForSnipers_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(simulateForGroupMembers) {
        displayName = CSTRING(simulateForGroupMembers_DisplayName);
        description = CSTRING(simulateForGroupMembers_Description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(simulateForEveryone) {
        displayName = CSTRING(simulateForEveryone_DisplayName);
        description = CSTRING(simulateForEveryone_Description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(disabledInFullAutoMode) {
        displayName = CSTRING(disabledInFullAutoMod_DisplayName);
        description = CSTRING(disabledInFullAutoMod_Description);
        typeName = "BOOL";
        value = 0;
    };
    /* // TODO: We currently do not have firedEHs on vehicles
    class GVAR(vehicleGunnerEnabled) {
        displayName = "Enabled For Vehicle Gunners";
        description = "Enables advanced ballistics for vehicle gunners";
        typeName = "BOOL";
        value = 0;
    };
    */
    class GVAR(ammoTemperatureEnabled) {
        displayName = CSTRING(ammoTemperatureEnabled_DisplayName);
        description = CSTRING(ammoTemperatureEnabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(barrelLengthInfluenceEnabled) {
        displayName = CSTRING(barrelLengthInfluenceEnabled_DisplayName);
        description = CSTRING(barrelLengthInfluenceEnabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(bulletTraceEnabled) {
        displayName = CSTRING(bulletTraceEnabled_DisplayName);
        description = CSTRING(bulletTraceEnabled_Description);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(simulationInterval) {
        displayName = CSTRING(simulationInterval_DisplayName);
        description = CSTRING(simulationInterval_Description);
        typeName = "SCALAR";
        value = 0.0;
    };
    class GVAR(simulationRadius) {
        displayName = CSTRING(simulationRadius_DisplayName);
        description = CSTRING(simulationRadius_Description);
        typeName = "SCALAR";
        value = 3000;
    };
};
