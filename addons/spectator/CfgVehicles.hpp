class CfgVehicles {
    class ACE_Module;
    class GVAR(moduleSettings): ACE_Module {
        scope = 1;
        displayName = CSTRING(Settings_DisplayName);
        icon = QPATHTOF(data\Icon_Module_Spectator_ca.paa);
        category = "ACE";
        function = QFUNC(moduleSpectatorSettings);
        isGlobal = 1;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class enableAI {
                displayName = CSTRING(ai_DisplayName);
                description = CSTRING(ai_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class cameraModes {
                displayName = CSTRING(modes_DisplayName);
                description = CSTRING(modes_Description);
                typeName = "NUMBER";
                class values {
                    class all {
                        name = CSTRING(modes_all);
                        value = 0;
                        default = 1;
                    };
                    class unit {
                        name = CSTRING(modes_unit);
                        value = 1;
                    };
                    class free {
                        name = "$STR_A3_Spectator_free_camera_tooltip";
                        value = 2;
                    };
                    class internal  {
                        name = "$STR_A3_Spectator_1pp_camera_tooltip";
                        value = 3;
                    };
                    class external  {
                        name = "$STR_A3_Spectator_3pp_camera_tooltip";
                        value = 4;
                    };
                };
            };
            class visionModes {
                displayName = CSTRING(visions_DisplayName);
                description = CSTRING(visions_Description);
                typeName = "NUMBER";
                class values {
                    class all {
                        name = CSTRING(modes_all);
                        value = 0;
                        default = 1;
                    };
                    class nv {
                        name = CSTRING(visions_nv);
                        value = 1;
                    };
                    class ti {
                        name = CSTRING(visions_ti);
                        value = 2;
                    };
                    class none  {
                        name = "$STR_Special_None";
                        value = 3;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(Settings_Description);
        };
    };
    class VirtualMan_F;
    class GVAR(virtual): VirtualMan_F {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Settings_DisplayName);
        scope = 2;
        scopeArsenal = 0;
        scopeCurator = 0;

        weapons[] = {};

        delete ACE_Actions;
        delete ACE_SelfActions;
    };
};
