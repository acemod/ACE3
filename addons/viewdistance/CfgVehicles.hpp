class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings) : ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        function = QUOTE(DFUNC(initModule));
        displayName = "View Distance Limiter";
        scope = 2;
        isGlobal = 1;
        //icon = ""; // needs an icon
        class Arguments {
            class moduleViewDistanceEnabled {
                displayName = "Enable ACE viewdistance";
                description = "Enables ACE viewdistance";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class moduleViewDistanceLimit {
                displayName = "View Distance Limit";
                description = "Sets the limit for how high clients can raise their view distance (<= 10000)";
                typeName = "NUMBER";
                defaultValue = 10000;
            };
        };
    };
};