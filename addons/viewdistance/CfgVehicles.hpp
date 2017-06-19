class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        function = QUOTE(DFUNC(initModule));
        displayName = CSTRING(Module_DisplayName);
        scope = 2;
        isGlobal = 1;
        isSingular = 1;
        //icon = ""; // needs an icon
        class Arguments {
            class moduleViewDistanceEnabled {
                displayName = CSTRING(enabled_DisplayName);
                description = CSTRING(enabled_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class moduleViewDistanceLimit {
                displayName = CSTRING(limit_DisplayName);
                description = CSTRING(limit_Description);
                typeName = "NUMBER";
                defaultValue = 10000;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
            sync[] = {};
        };
    };
};
