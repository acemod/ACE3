class CfgVehicles {
    class Module_F;
    class GVAR(Module): Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "Wind Deflection";
        function = FUNC(initalizeModule);
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_Wind_ca.paa));
        class Arguments {
            class EnableForAI {
                displayName = "Enable for AI";
                description = "Should the module be enabled for AI";
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
    };
};
