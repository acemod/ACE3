class CfgVehicles {
    class ACE_Module;
    class ACE_moduleAllowConfigExport: ACE_Module {
        scope = 2;
        displayName = CSTRING(AllowConfigExport_Module_DisplayName);
        //icon = "";
        category = "ACE";
        function = QUOTE(DFUNC(moduleAllowConfigExport));
        functionPriority = 1;
        isGlobal = 1;
        isSingular = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class allowconfigurationExport {
                displayName = CSTRING(AllowConfigExport_allowconfigurationExport_DisplayName);
                description = CSTRING(AllowConfigExport_allowconfigurationExport_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(AllowConfigExport_Module_Description);
            sync[] = {};
        };
    };
};
