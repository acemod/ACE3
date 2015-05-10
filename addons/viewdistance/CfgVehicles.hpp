class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings) : ACE_Module {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        function = QUOTE(DFUNC(initModule));
        displayName = "View Distance Limiter";
        scope = 2;
        isGlobal = 1;
        //icon = ""; // needs an icon
        class Arguments {
            class moduleViewDistanceLimit {
                displayName = "View Distance Limit";
                description = "Sets the limit for how high clients can raise their view distance (<= 10000)";
                typeName = "NUMBER";
                defaultValue = 10000;
            };
        };
    };
};