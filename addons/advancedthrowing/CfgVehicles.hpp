class CfgVehicles {
    class ACE_Module;
    class GVAR(Module): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Category);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1;
        //icon = PATHTOF(UI\Icon_Module_AdvancedThrowing_ca.paa);//@todo
        class Arguments {
            class Enabled {
                displayName = CSTRING(EnableThrowingSystem_DisplayName);
                description = CSTRING(EnableThrowingSystem_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class ShowThrowArc {
                displayName = CSTRING(ShowThrowArc_DisplayName);
                description = CSTRING(ShowThrowArc_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class ShowMouseControls {
                displayName = CSTRING(ShowMouseControls_DisplayName);
                description = CSTRING(ShowMouseControls_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };
};
