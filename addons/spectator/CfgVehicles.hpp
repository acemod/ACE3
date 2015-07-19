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
            class spectatorSystem {
                displayName = CSTRING(system_DisplayName);
                description = CSTRING(system_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class spectatorUnits {
                displayName = CSTRING(units_DisplayName);
                description = CSTRING(units_Description);
                typeName = "NUMBER";
                class values {
                    class none {
                        name = "$STR_Special_None";
                        value = 0;
                        default = 1;
                    };
                    class players {
                        name = CSTRING(units_players);
                        value = 1;
                    };
                    class all  {
                        name = CSTRING(units_all);
                        value = 2;
                    };
                };
            };
            class spectatorSides {
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
        };
        class ModuleDescription {
            description = CSTRING(Settings_Description);
        };
    };
};
