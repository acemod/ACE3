class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 2;
        displayName = "Weather";
        icon = QUOTE(PATHTOF(UI\Icon_Module_Wind_ca.paa));
        category = "ACE";
        function = QUOTE(DFUNC(initModuleSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class enableServerController {
                displayName = "Weather propagation";
                description = "Enables sever side weather propagation";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class useACEWeather {
                displayName = "ACE Weather";
                description = "Overrides the default weather (editor, mission settings) with ACE weather (map based)";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class syncRain {
                displayName = "Sync Rain";
                description = "Synchronizes rain";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class syncWind {
                displayName = "Sync Wind";
                description = "Synchronizes wind";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class syncMisc {
                displayName = "Sync Misc";
                description = "Synchronizes lightnings, rainbow, fog, ...";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class serverUpdateInterval {
                displayName = "Update Interval";
                description = "Defines the interval (seconds) between weather updates";
                typeName = "NUMBER";
                defaultValue = 60;
            };
        };
    };
};
