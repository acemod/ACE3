class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 2;
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
            class simulateForSnipers {
                displayName = CSTRING(simulateForSnipers_DisplayName);
                description = CSTRING(simulateForSnipers_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class simulateForGroupMembers {
                displayName = CSTRING(simulateForGroupMembers_DisplayName);
                description = CSTRING(simulateForGroupMembers_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class simulateForEveryone {
                displayName = CSTRING(simulateForEveryone_DisplayName);
                description = CSTRING(simulateForEveryone_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class disabledInFullAutoMode {
                displayName = CSTRING(disabledInFullAutoMod_DisplayName);
                description = CSTRING(disabledInFullAutoMod_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            /* // TODO: We currently do not have firedEHs on vehicles
            class vehicleGunnerEnabled {
                displayName = "Enabled For Vehicle Gunners";
                description = "Enables advanced ballistics for vehicle gunners";
                typeName = "BOOL";
                defaultValue = 0;
            };
            */
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
            class simulationRadius {
                displayName = CSTRING(simulationRadius_DisplayName);
                description = CSTRING(simulationRadius_Description);
                typeName = "NUMBER";
                defaultValue = 3000;
            };
        };
        class ModuleDescription {
            description = CSTRING(Description);
        };
    };
};