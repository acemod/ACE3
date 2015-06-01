class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings) : ACE_Module {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        function = QUOTE(DFUNC(initModule));
        displayName = "$STR_ACE_ViewDistance_Module_DisplayName";
        scope = 2;
        isGlobal = 1;
        //icon = ""; // needs an icon
        class Arguments {
            class moduleViewDistanceEnabled {
                displayName = "$STR_ACE_ViewDistance_enabled_DisplayName";
                description = "$STR_ACE_ViewDistance_enabled_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class moduleViewDistanceLimit {
                displayName = "$STR_ACE_ViewDistance_limit_DisplayName";
                description = "$STR_ACE_ViewDistance_limit_Description";
                typeName = "NUMBER";
                defaultValue = 10000;
            };
        };
		class ModuleDescription {
            description = "$STR_ACE_ViewDistance_Module_Description";
            sync[] = {};
        };
    };
};