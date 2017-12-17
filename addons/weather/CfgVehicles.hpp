class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 1;
        displayName = CSTRING(Module_DisplayName);
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
                displayName = CSTRING(enabled_DisplayName);
                description = CSTRING(enabled_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class updateInterval {
                displayName = CSTRING(updateInterval_DisplayName);
                description = CSTRING(updateInterval_Description);
                typeName = "NUMBER";
                defaultValue = 60;
            };
            class windSimulation {
                displayName = CSTRING(windSimulation_DisplayName);
                description = CSTRING(windSimulation_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };
};
