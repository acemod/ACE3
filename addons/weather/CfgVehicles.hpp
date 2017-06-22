class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 2;
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
            class enableServerController {
                displayName = CSTRING(enableServerController_DisplayName);
                description = CSTRING(enableServerController_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class useACEWeather {
                displayName = CSTRING(useACEWeather_DisplayName);
                description = CSTRING(useACEWeather_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class syncRain {
                displayName = CSTRING(syncRain_DisplayName);
                description = CSTRING(syncRain_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class syncWind {
                displayName = CSTRING(syncWind_DisplayName);
                description = CSTRING(syncWind_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class syncMisc {
                displayName = CSTRING(syncMisc_DisplayName);
                description = CSTRING(syncMisc_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class serverUpdateInterval {
                displayName = CSTRING(serverUpdateInterval_DisplayName);
                description = CSTRING(serverUpdateInterval_Description);
                typeName = "NUMBER";
                defaultValue = 60;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };
};
