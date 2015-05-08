class CfgVehicles {
    class Module_F;
    class ACE_ModuleViewDistance : Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "View Distance Limit";
        function = QFUNC(moduleViewDistance);
        scope = 2;
        isGlobal = 1;
        //icon = ""; // needs an icon
        class Arguments {
            class ViewDistanceLimit {
                displayName = "View Distance setting limit";
                description = "Sets the limit for how high clients can raise their view distance (< 10,000)";
                typeName = "NUMBER";
                defaultValue = 10000;
            };
        };
    };
};