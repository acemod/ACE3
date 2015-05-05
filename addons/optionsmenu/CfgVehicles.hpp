class CfgVehicles {
    class ACE_Module;
    class ACE_moduleAllowConfigExport: ACE_Module {
        scope = 2;
        displayName = "$STR_AllowConfigExport_Module_DisplayName";
        //icon = "";
        category = "ACE";
        function = QUOTE(DFUNC(moduleAllowConfigExport));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class allowconfigurationExport {
                displayName = "$STR_AllowConfigExport_allowconfigurationExport_DisplayName";
                description = "$STR_AllowConfigExport_allowconfigurationExport_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = "$STR_AllowConfigExport_Module_Description";
            sync[] = {};
        };
    };
};