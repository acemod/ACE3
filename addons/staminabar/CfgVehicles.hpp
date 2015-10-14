class CfgVehicles {
    class ACE_Module;
    class ACE_ModuleStaminaBar: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(ModuleDisplayName);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_StaminaBar_ca.paa));
        class Arguments {
            class enabled {
                displayName = CSTRING(Show);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDescription);
        };
    };
};
