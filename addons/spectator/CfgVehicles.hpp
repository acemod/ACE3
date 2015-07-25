class CfgVehicles {
    class ACE_Module;
    class GVAR(moduleSettings): ACE_Module {
        scope = 2;
        displayName = CSTRING(Settings_DisplayName);
        icon = PATHTOF(UI\Icon_Module_Spectator_ca.paa);
        category = "ACE";
        function = QFUNC(moduleSpectatorSettings);
        isGlobal = 1;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class unitsFilter {
                displayName = CSTRING(units_DisplayName);
                description = CSTRING(units_Description);
                typeName = "NUMBER";
                class values {
                    class none {
                        name = CSTRING(units_none);
                        value = 0;
                    };
                    class players {
                        name = CSTRING(units_players);
                        value = 1;
                        default = 1;
                    };
                    class all  {
                        name = CSTRING(units_all);
                        value = 2;
                    };
                };
            };
            class sidesFilter {
                displayName = CSTRING(sides_DisplayName);
                description = CSTRING(sides_Description);
                typeName = "NUMBER";
                class values {
                    class player {
                        name = CSTRING(sides_player);
                        value = 0;
                        default = 1;
                    };
                    class friendly {
                        name = CSTRING(sides_friendly);
                        value = 1;
                    };
                    class hostile {
                        name = CSTRING(sides_hostile);
                        value = 2;
                    };
                    class all  {
                        name = CSTRING(sides_all);
                        value = 3;
                    };
                };
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
                        name = CSTRING(modes_free);
                        value = 2;
                    };
                    class internal  {
                        name = CSTRING(modes_internal);
                        value = 3;
                    };
                    class external  {
                        name = CSTRING(modes_external);
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
            class unitIcons {
                displayName = CSTRING(icons_DisplayName);
                description = CSTRING(icons_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(Settings_Description);
        };
    };
};
