class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 1;
        displayName = CSTRING(windDeflection_DisplayName);
        icon = QPATHTOF(UI\Icon_Module_Wind_ca.paa);
        category = "ACE";
        function = QUOTE(DFUNC(initModuleSettings));
        functionPriority = 1;
        isGlobal = 1;
        isSingular = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class enabled {
                displayName = CSTRING(deflectionModule_DisplayName);
                description = CSTRING(deflectionModule_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleEnabled {
                displayName = CSTRING(vehicleEnabled_DisplayName);
                description = CSTRING(vehicleEnabled_Description);
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
            description = CSTRING(windDeflection_Description);
        };
    };
};
