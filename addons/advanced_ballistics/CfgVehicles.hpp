class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 1;
        displayName = CSTRING(DisplayName);
        icon = QPATHTOF(UI\Icon_Module_Wind_ca.paa);
        category = "ACE";
        function = QUOTE(DFUNC(initModuleSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "Ruthberg";
        class Arguments {
            class enabled {
                displayName = CSTRING(enabled_DisplayName);
                description = CSTRING(enabled_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class muzzleVelocityVariationEnabled {
                displayName = CSTRING(muzzleVelocityVariationEnabled_DisplayName);
                description = CSTRING(muzzleVelocityVariationEnabled_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class ammoTemperatureEnabled {
                displayName = CSTRING(ammoTemperatureEnabled_DisplayName);
                description = CSTRING(ammoTemperatureEnabled_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class barrelLengthInfluenceEnabled {
                displayName = CSTRING(barrelLengthInfluenceEnabled_DisplayName);
                description = CSTRING(barrelLengthInfluenceEnabled_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class bulletTraceEnabled {
                displayName = CSTRING(bulletTraceEnabled_DisplayName);
                description = CSTRING(bulletTraceEnabled_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class simulationInterval {
                displayName = CSTRING(simulationInterval_DisplayName);
                description = CSTRING(simulationInterval_Description);
                typeName = "NUMBER";
                defaultValue = 0.05;
            };
        };
        class ModuleDescription {
            description = CSTRING(Description);
        };
    };
};
