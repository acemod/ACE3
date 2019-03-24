class CfgVehicles {
    class ACE_Module;
    class GVAR(module): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE_missionModules";
        displayName = CSTRING(DisplayName);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1;
        isTriggerActivated = 0;
        isDisposable = 0;
        icon = QPATHTOF(UI\Icon_Module_Slideshow_ca.paa);
        class Arguments {
            class Objects {
                displayName = CSTRING(Objects_DisplayName);
                description = CSTRING(Objects_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Controllers {
                displayName = CSTRING(Controllers_DisplayName);
                description = CSTRING(Controllers_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Images {
                displayName = CSTRING(Images_DisplayName);
                description = CSTRING(Images_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Names {
                displayName = CSTRING(Names_DisplayName);
                description = CSTRING(Names_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class SetName {
                displayName = CSTRING(SetName_DisplayName);
                description = CSTRING(SetName_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Duration {
                displayName = CSTRING(Duration_DisplayName);
                description = CSTRING(Duration_Description);
                typeName = "NUMBER";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(Description);
        };
    };
};
