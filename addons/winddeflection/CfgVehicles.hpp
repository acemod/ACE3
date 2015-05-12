class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 2;
        displayName = "$STR_ACE_Weather_windDeflection_DisplayName";
        icon = QUOTE(PATHTOF(UI\Icon_Module_Wind_ca.paa));
        category = "ACE";
        function = QUOTE(DFUNC(initModuleSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class enabled {
                displayName = "$STR_ACE_Weather_deflectionModule_DisplayName";
                description = "$STR_ACE_Weather_deflectionModule_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleEnabled {
                displayName = "$STR_ACE_Weather_vehicleEnabled_DisplayName";
                description = "$STR_ACE_Weather_vehicleEnabled_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class simulationInterval {
                displayName = "$STR_ACE_Weather_simulationInterval_DisplayName";
                description = "$STR_ACE_Weather_simulationInterval_Description";
                typeName = "NUMBER";
                defaultValue = 0.05;
            };
            class simulationRadius {
                displayName = "$STR_ACE_Weather_simulationRadius_DisplayName";
                description = "$STR_ACE_Weather_simulationRadius_Description";
                typeName = "NUMBER";
                defaultValue = 3000;
            };
        };
        class ModuleDescription {
            description = "$STR_ACE_Weather_windDeflection_Description";
        };
    };
};