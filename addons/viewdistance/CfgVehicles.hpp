class CfgVehicles {
    class Module_F;
    class ACE_ModuleViewDistance : Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "View Distance Limiter";
        function = QFUNC(module);
        scope = 2;
        isGlobal = 1;
        //icon = ""; // needs an icon
        class Arguments {
            class moduleViewDistanceLimit {
                displayName = "View Distance Limit";
                description = "Sets the limit for how high clients can raise their view distance (< 10000)";
                typeName = "SCALAR";
                defaultValue = 6000;
            };
        };
    };
};