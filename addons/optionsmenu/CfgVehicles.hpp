class CfgVehicles {
    class ACE_Module;
    // TODO localization for all the modules
    class ACE_moduleAllowConfigExport: ACE_Module {
        scope = 2;
        displayName = "Allow Config Export [ACE]";
        //icon = "";
        category = "ACE";
        function = QUOTE(DFUNC(moduleAllowConfigExport));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments {
            class allowconfigurationExport {
                displayName = "Allow";
                description = "Allow export of all settings to a server config formatted.";
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = "When allowed, you have access to the settings modification and export in SP. Clicking export will place the formated config on your clipboard.";
            sync[] = {};
        };
    };

};