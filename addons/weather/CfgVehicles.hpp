class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 2;
        displayName = "$STR_ACE_Weather_Module_DisplayName";
        icon = QUOTE(PATHTOF(UI\Icon_Module_Wind_ca.paa));
        category = "ACE";
        function = QUOTE(DFUNC(initModuleSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class enableServerController {
                displayName = "$STR_ACE_Weather_enableServerController_DisplayName";
                description = "$STR_ACE_Weather_enableServerController_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class useACEWeather {
                displayName = "$STR_ACE_Weather_useACEWeather_DisplayName";
                description = "$STR_ACE_Weather_useACEWeather_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class syncRain {
                displayName = "$STR_ACE_Weather_syncRain_DisplayName";
                description = "$STR_ACE_Weather_syncRain_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class syncWind {
                displayName = "$STR_ACE_Weather_syncWind_DisplayName";
                description = "$STR_ACE_Weather_syncWind_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class syncMisc {
                displayName = "$STR_ACE_Weather_syncMisc_DisplayName";
                description = "$STR_ACE_Weather_syncMisc_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class serverUpdateInterval {
                displayName = "$STR_ACE_Weather_serverUpdateInterval_DisplayName";
                description = "$STR_ACE_Weather_serverUpdateInterval_Description";
                typeName = "NUMBER";
                defaultValue = 60;
            };
        };
        class ModuleDescription {
            description = "$STR_ACE_Weather_Module_Description";
        };
    };
};