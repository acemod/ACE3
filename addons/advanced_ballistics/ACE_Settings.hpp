class ACE_Settings {
    class GVAR(enabled) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(enabled_DisplayName);
        description = CSTRING(enabled_Description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(muzzleVelocityVariationEnabled) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(muzzleVelocityVariationEnabled_DisplayName);
        description = CSTRING(muzzleVelocityVariationEnabled_Description);
        typeName = "BOOL";
        value = 1;
    }; 
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
        sliderSettings[] = {0, 0.2, 0.05, 2};
    };
};
